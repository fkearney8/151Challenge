package controllers.handlers

import OneFiveOneUtils._
import java.util.{TimeZone, Calendar}

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
      import PercentageCalculator._
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
    val eachDayFromStartToYesterday = fromStartToYesterday()
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

  def bestDayYesterday(): UserAggregateExercises = {
    val totalsPerDay = totalsPerDayPerUser()

    totalsPerDay.foreach { calAndTotals =>
      Logger.debug("\n\nFor date: " + printableDate(calAndTotals._1))
      val userTotalsForDay = calAndTotals._2
      userTotalsForDay.foreach(eachTotal => Logger.debug("\t" + eachTotal))
    }

    val yesterdaysEntries = totalsPerDayPerUser().find(dailyEntries => isGivenTimeWithinDay(dailyEntries._1, getYesterday()))
    yesterdaysEntries match {
      case Some((yesterday: Calendar, yesterdaysEntries: List[UserAggregateExercises])) =>
        //TODO tries to use a negative ordering here, basically adding a unary - and not reversing, so that we could pass in the ordering function to use for
        // sorting entries, but it didn't work for some reason. Non-negative ordering with a reverse works fine, but then the ordering
        // transformation is actually the opposite of what is really desired, so passing it in makes less sense.
        //yesterdaysEntries.sortBy(userTotals => -PercentageCalculator.calculateOverallPercentComplete(userTotals)).head
        yesterdaysEntries.sortBy(userTotals => PercentageCalculator.calculateOverallPercentComplete(userTotals)).reverse.head
      case None =>
        UserAggregateExercises(-1, "No One", 0, 0, 0, 0)
    }

//    def transformerForUserTotals(userTotals: UserAggregateExercises) = -PercentageCalculator.calculateOverallPercentComplete(userTotals)
  }

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

  def getYesterday(): Calendar = {
    //calculate yesterday based on PST, so that our west coasters see yesterday making sense after 9pm
    val yesterday = Calendar.getInstance()
    OneFiveOneUtils.roundToDay(yesterday)
    yesterday.roll(Calendar.DAY_OF_YEAR, -1)
    Logger.debug("Yesterday is " + printableDate(yesterday) + " or more fully: " + yesterday)
    yesterday
  }

  private def fromStartToYesterday(): Seq[Calendar] = {
    val start = OneFiveOneConstants.START_OF_CHALLENGE
    //TODO make this a nice recursive without the vars
    val yesterday = getYesterday()
    var currentDay = start
    var output = List.empty[Calendar]
    while (currentDay.compareTo(yesterday) <= 0) {
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

