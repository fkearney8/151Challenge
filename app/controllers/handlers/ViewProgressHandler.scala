package controllers.handlers

import java.util.{TimeZone, Calendar}

import controllers.handlers.OneFiveOneUtils._
import models._
import play.api.Logger

object ViewProgressHandler {

  def eachUserTotals(): List[UserAggregateExercises] = {
    //retrieve each user
    val allUsers = Users.findAll

    allUsers.map{(eachUser) =>
      val entriesPerUser = ExerciseEntries.getAllForUser(eachUser.id)
      val totalsMap = sumEntries(entriesPerUser)
      new UserAggregateExercises(eachUser, totalsMap)
    }
  }

  def eachUserTotalsWithPercentages(): List[(UserAggregateExercises, PercentagesCompleted)] = {
    val userTotals = eachUserTotals()
    userTotals.map{userTotal =>
      import controllers.handlers.PercentageCalculator._
      val percentagesCompleted = PercentagesCompleted(
        sitUpsPercentComplete(userTotal.situps),
        lungesPercentComplete(userTotal.lunges),
        burpeesPercentComplete(userTotal.burpees),
        milesPercentComplete(userTotal.miles),
        calculateOverallPercentComplete(userTotal)
      )
      (userTotal, percentagesCompleted)
    }.sortBy{overallPercentageOrdering}.reverse
  }

  def overallPercentageOrdering(totalAndPercentages: (UserAggregateExercises, PercentagesCompleted)): BigDecimal = {
    totalAndPercentages._2.overallPercent
  }

  def sumEntries(entriesToSim: List[ExerciseEntry]): Map[ExerciseType.Value, BigDecimal] = {
    val totalsForUser = entriesToSim.foldLeft{Map.empty[ExerciseType.Value, BigDecimal]} {
        (runningTotals: Map[ExerciseType.Value, BigDecimal], exerciseEntry: ExerciseEntry) => {
      val exerciseType: ExerciseType.Value = exerciseEntry.exerciseType
      val currentAmount = runningTotals.getOrElse(exerciseType, BigDecimal(0))
      runningTotals + (exerciseType -> (currentAmount + exerciseEntry.reps))
    }}
    totalsForUser
  }

  /**
   * Gets a map of days to a map of user -> totals for that day, starting from the beginning of the challenge.
   */
  def totalsPerDayPerUser(): List[(Calendar, List[UserAggregateExercises])] = {
    //from the start of the challenge until today
    val eachDayFromStartToYesterday = fromStartToToday()
    val allEntries = ExerciseEntries.getAll()
    val allUsers = Users.findAll

    val dailyEntryTotals = for (eachDay <- eachDayFromStartToYesterday) yield {
      //find all the entries for this day
      val entriesForDay = allEntries.filter{ eachEntry: ExerciseEntry =>
        wasEntryOnDay(eachEntry, eachDay)
      }
      Logger.debug("Entries for day " + printableDate(eachDay) + "(" + eachDay.getTimeInMillis + ")" + " are " + entriesForDay.map(entry => printableDate(entry.when) + "(" + entry.when.getTimeInMillis + ")"))
      //for each user sum up their entries for this day
      val userToDailyTotals = for (eachUser <- allUsers) yield {
        val entriesForUser = entriesForDay.filter(exerciseEntry => exerciseEntry.userId == eachUser.id)
        val userDailyTotal = sumEntries(entriesForUser)
        new UserAggregateExercises(eachUser, userDailyTotal)
      }
      (eachDay, userToDailyTotals)
    }
    dailyEntryTotals.sortBy(calendarAndMap => calendarAndMap._1.getTimeInMillis).toList
  }

  /**
   *
   * @param day the day on which to find the best entry
   * @param sorterLt A sorting order on the user totals to find the 'best' that you're looking for.
   */
  def bestProgressOnDay(day: Calendar, sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean): UserAggregateExercises = {
    val entriesOnDay = totalsPerDayPerUser().find(dailyEntries => isGivenTimeWithinDay(dailyEntries._1, day))
    entriesOnDay match {
      case Some((yesterday: Calendar, yesterdaysEntries: List[UserAggregateExercises])) =>
        yesterdaysEntries.sortWith(sorterLt).head
      case None =>
        UserAggregateExercises(-1, "No One", 0, 0, 0, 0)
    }
  }

  /** Convenience method to create functions for finding the greater of two UserAggregateExercises based on the tranfotmation
    * given.
    * @param uaeTranformation How to transform UAEs to compare them.
    * @return a function for use in a sortWith to compare UAEs
    */
  def findTheGreatestOf(uaeTranformation: (UserAggregateExercises => BigDecimal)): (UserAggregateExercises, UserAggregateExercises) => Boolean = {
    case (uae1: UserAggregateExercises, uae2: UserAggregateExercises) =>
      uaeTranformation(uae1) > uaeTranformation(uae2)
  }

  def bestSitUpsYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf((uae: UserAggregateExercises) => uae.situps))
  def bestLungesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf((uae: UserAggregateExercises) => uae.lunges))
  def bestBurpeesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf((uae: UserAggregateExercises) => uae.burpees))
  def bestMilesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf((uae: UserAggregateExercises) => uae.miles))

  def bestProgressYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf((uae: UserAggregateExercises) =>
      PercentageCalculator.calculateOverallPercentComplete(uae)))


  private def wasEntryOnDay(eachEntry: ExerciseEntry, dayInQuestion: Calendar): Boolean = {
    val entryDay = eachEntry.when
    isGivenTimeWithinDay(entryDay, dayInQuestion)
  }

  private def isGivenTimeWithinDay(givenTime: Calendar, dayInQuestion: Calendar): Boolean = {
    (givenTime.compareTo(dayInQuestion) >= 0) && givenTime.before(nextDay(dayInQuestion))
  }

  def nextDay(currentDay: Calendar): Calendar = {
    val nextDay: Calendar = Calendar.getInstance()
    nextDay.setTimeInMillis(currentDay.getTimeInMillis + 24 * 60 * 60 * 1000)
    nextDay
  }

  def getYesterday: Calendar = {
    //calculate yesterday based on PST, so that our west coasters see yesterday making sense after 4pm when UTC flips over.
    val yesterdayPT = Calendar.getInstance(TimeZone.getTimeZone("America/Los_Angeles"))
    OneFiveOneUtils.roundToDay(yesterdayPT)
    yesterdayPT.roll(Calendar.DAY_OF_YEAR, -1)

    //create a 'yesterday' in the default TZ, (which will be UTC on the production host, but this will work regardless of what it is)
    // and set the year, month, and day for the pacific time's yesterday onto it. We have to do this because we want to be
    // looking for exercises that are marked as entered at 12:00am on yesterday in the default time zone of the remote host, but we
    // want to think of yesterday as the day before today in pacific time.
    val yesterdayDefaultTZ = Calendar.getInstance()
    yesterdayDefaultTZ.set(Calendar.YEAR, yesterdayPT.get(Calendar.YEAR))
    yesterdayDefaultTZ.set(Calendar.MONTH, yesterdayPT.get(Calendar.MONTH))
    yesterdayDefaultTZ.set(Calendar.DAY_OF_YEAR, yesterdayPT.get(Calendar.DAY_OF_YEAR))
    OneFiveOneUtils.roundToDay(yesterdayDefaultTZ)

    yesterdayDefaultTZ
  }

  private def fromStartToToday(): Seq[Calendar] = {
    val start = OneFiveOneConstants.START_OF_CHALLENGE
    var currentDay = start
    val today = roundToDay(Calendar.getInstance())

    var output = List.empty[Calendar]
    //TODO make this a nice recursive without the vars
    while (currentDay.compareTo(today) <= 0) {
      output = output :+ currentDay
      currentDay = nextDay(currentDay)
    }
    Logger.debug("\n\nUsing days:\n" + output.map(printableDate(_) + "\n"))

    output
  }
}

case class UserAggregateExercises(userId: Int, username: String, situps: Int, lunges: Int, burpees: Int, miles: BigDecimal) {
  def this(user: User, totalsMap: Map[ExerciseType.Value, BigDecimal]) {
    this(user.id, user.username,
      totalsMap.getOrElse(ExerciseType.SitUps, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Lunges, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Burpees, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Miles, BigDecimal(0))
    )
  }
}

case class PercentagesCompleted(sitUpsPercent: BigDecimal, lungesPercent: BigDecimal, burpeesPercent: BigDecimal, milesPercent: BigDecimal, overallPercent: BigDecimal)

