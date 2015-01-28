package controllers.handlers

import java.util.Calendar

import controllers.handlers.OneFiveOneDateUtils._
import models._
import play.api.Logger

import scala.collection.immutable.SortedMap

//TODO divide this object up into classes that know about how to handle a day's totals for all users, keep static methods in here for
// finding the best of certain categories from lists of aggregate data.
object AggregateDataHandler {
  
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
        sitUpsPercentComplete(userTotal.sitUps),
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

  def sumEntries(entriesToSum: List[ExerciseEntry]): AnonymousAggregateExercises = {
    val totaledEntries = entriesToSum.foldLeft{Map.empty[ExerciseType.Value, BigDecimal]} {
        (runningTotals: Map[ExerciseType.Value, BigDecimal], exerciseEntry: ExerciseEntry) => {
      val exerciseType: ExerciseType.Value = exerciseEntry.exerciseType
      val currentAmount = runningTotals.getOrElse(exerciseType, BigDecimal(0))
      runningTotals + (exerciseType -> (currentAmount + exerciseEntry.reps))
    }}
    new AnonymousAggregateExercises(totaledEntries)
  }

  /**
   * Gets a map of days to a list of each user's totals for that day, starting from the beginning of the challenge.
   * Last entry in returned list will be today.
   */
  def totalsPerDayPerUser(): SortedMap[Calendar, List[UserAggregateExercises]] = {
    //from the start of the challenge until today
    val eachDayFromStartToYesterday = fromStartToToday()
    val allEntries = ExerciseEntries.getAll()
    val allUsers = Users.findAll

    val dailyEntryTotals = for (eachDay <- eachDayFromStartToYesterday) yield {
      //find all the entries for this day
      val entriesForDay = allEntries.filter{ eachEntry: ExerciseEntry =>
        wasEntryOnDay(eachEntry, eachDay)
      }
      //for each user sum up their entries for this day
      val userToDailyTotals = for (eachUser <- allUsers) yield {
        val entriesForUser = entriesForDay.filter(exerciseEntry => exerciseEntry.userId == eachUser.id)
        val userDailyTotal = sumEntries(entriesForUser)
        new UserAggregateExercises(eachUser, userDailyTotal)
      }
      eachDay -> userToDailyTotals
    }
    val sortedDailyEntries = dailyEntryTotals.sortBy(calendarAndMap => calendarAndMap._1.getTimeInMillis)
    SortedMap(sortedDailyEntries:_*)
  }

  /**
   *
   * @param day the day on which to find the best entry
   * @param sorterLt A sorting order on the user totals to find the 'best' that you're looking for.
   */
  def bestProgressOnDay(day: Calendar, sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean): UserAggregateExercises = {
    val entriesOnDay = totalsPerDayPerUser().find(dailyEntries => isGivenTimeWithinDay(dailyEntries._1, day))
    entriesOnDay match {
      case Some((day: Calendar, dayEntries: List[UserAggregateExercises])) =>
        bestProgressOf(dayEntries, sorterLt)
      case None =>
        NoOneTotal
    }
  }

  private val NoOneTotal: UserAggregateExercises = UserAggregateExercises(-1, "No One", 0, 0, 0, 0)

  private def bestProgressOf(entries: List[UserAggregateExercises],
                             sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean): UserAggregateExercises = {      
    entries.sortWith(sorterLt).head
  }
  

  /** Convenience method to create functions for finding the greater of two UserAggregateExercises based on the transformation
    * given.
    * @param uaeTransformation How to transform UAEs to compare them.
    * @return a function for use in a sortWith to compare UAEs
    */
  def findTheGreatestOf(uaeTransformation: (UserAggregateExercises => BigDecimal)): (UserAggregateExercises, UserAggregateExercises) => Boolean = {
    case (uae1: UserAggregateExercises, uae2: UserAggregateExercises) =>
      uaeTransformation(uae1) > uaeTransformation(uae2)
  }

  def bestSitUpsYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.sitUps))
  def bestLungesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.lunges))
  def bestBurpeesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.burpees))
  def bestMilesYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.miles))

  def bestOverallProgressYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(
    PercentageCalculator.calculateOverallPercentComplete(_)
  ))

  def everyoneTotalsForAllDays(): AnonymousAggregateExercises = {
    val allEntries = ExerciseEntries.getAll()
    sumEntries(allEntries)
  }

  def everyoneBestDay(): (Calendar, AnonymousAggregateExercises) = {
    val userTotalsPerDay = totalsPerDayPerUser()
    val everyoneTotalsPerDay = userTotalsPerDay.map {
      case (day: Calendar, userTotals: List[UserAggregateExercises]) =>
        (day, sumUserTotals(userTotals))
    }
    everyoneTotalsPerDay.toList.sortBy{
      case (day: Calendar, totals: AnonymousAggregateExercises) =>
        -PercentageCalculator.calculateOverallPercentComplete(totals)
    }.head
  }

  def everyoneToday(): AnonymousAggregateExercises = {
    val userTotals = totalsPerDayPerUser()
    val todayTotals = userTotals.find(dailyEntries => isGivenTimeWithinDay(dailyEntries._1, getToday))
    todayTotals match {
      case Some((day: Calendar, todayUserAggregates: List[UserAggregateExercises])) =>
        sumUserTotals(todayUserAggregates)
      case None =>
        sumUserTotals(List())
    }

  }


  private def sumUserTotals(userTotalsList: Seq[UserAggregateExercises]): AnonymousAggregateExercises = {
    userTotalsList.foldLeft(new AnonymousAggregateExercises(0, 0, 0, 0.0)) {
      (runningTotals: AnonymousAggregateExercises, userTotals: UserAggregateExercises) =>
        new AnonymousAggregateExercises(runningTotals.sitUps + userTotals.sitUps,
          runningTotals.lunges + userTotals.lunges,
          runningTotals.burpees + userTotals.burpees,
          runningTotals.miles + userTotals.miles)
    }
  }

  /**
   * Find the best day a person has had, using the given sort (first (least) is best) and the given set of stuff to look through.
   * @return The day it happened and their totals on that day.
   */
  private def bestProgressAnyDay(sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean): (Calendar, UserAggregateExercises) = {
    val userTotals = totalsPerDayPerUser()
    val bestOfEachDay = userTotals.map { eachDayTotal =>
      val bestOfDay = bestProgressOf(eachDayTotal._2, sorterLt)
      (eachDayTotal._1, bestOfDay)
    }
    bestDayOf(sorterLt, bestOfEachDay)
  }

  /** Find the best day of the days data given. 'Best' is defined as the first (least) UserAggregateData given the sorterLt. */
  def bestDayOf(sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean, dailyTotals: SortedMap[Calendar, UserAggregateExercises]): (Calendar, UserAggregateExercises) = {
    dailyTotals.toList.sortWith { (calAndUae1: (Calendar, UserAggregateExercises), calAndUae2: (Calendar, UserAggregateExercises)) =>
      sorterLt(calAndUae1._2, calAndUae2._2)
    }.head
  }

  def bestOverallProgressAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(PercentageCalculator.calculateOverallPercentComplete(_)))
  def bestSitUpsAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.sitUps))
  def bestLungesAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.lunges))
  def bestBurpeesAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.burpees))
  def bestMilesAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.miles))
}

case class UserAggregateExercises(userId: Int, username: String, sitUps: Int, lunges: Int, burpees: Int, miles: BigDecimal)
  extends AggregateExercises {
  def this(user: User, aggregateExercises: AnonymousAggregateExercises) {
    this(user.id, user.username, aggregateExercises.sitUps, aggregateExercises.lunges, aggregateExercises.burpees, aggregateExercises.miles)
  }
}

case class AnonymousAggregateExercises(sitUps: Int, lunges: Int, burpees: Int, miles: BigDecimal) extends AggregateExercises {
  def this(totalsMap: Map[ExerciseType.Value, BigDecimal]) {
    this(totalsMap.getOrElse(ExerciseType.SitUps, BigDecimal(0)).toInt,
        totalsMap.getOrElse(ExerciseType.Lunges, BigDecimal(0)).toInt,
        totalsMap.getOrElse(ExerciseType.Burpees, BigDecimal(0)).toInt,
        totalsMap.getOrElse(ExerciseType.Miles, BigDecimal(0)))
  }
}

trait AggregateExercises {
  def sitUps: Int
  def lunges: Int
  def burpees: Int
  def miles: BigDecimal
}

case class PercentagesCompleted(sitUpsPercent: BigDecimal, lungesPercent: BigDecimal, burpeesPercent: BigDecimal, milesPercent: BigDecimal, overallPercent: BigDecimal)

