package controllers.handlers

import java.util.Calendar

import controllers.handlers.OneFiveOneDateUtils._
import models.{ExerciseEntry, ExerciseEntries, Users}
import controllers.handlers.AggregateDataHelper._
import org.slf4j.LoggerFactory

import scala.collection.immutable.SortedMap

object EveryoneTotals {
  val logger = LoggerFactory.getLogger("controllers.handlers.EveryoneTotals")

  def eachUserTotals(): List[UserAggregateExercises] = {
    //retrieve each user
    val allUsers = Users.findAll

    allUsers.map{(eachUser) =>
      val entriesPerUser = ExerciseEntries.getAllForUser(eachUser.id)
      val totalsMap = sumEntries(entriesPerUser)
      new UserAggregateExercises(eachUser, totalsMap, dayEarliestShotTaken(entriesPerUser))
    }
  }

  def eachUserTotalsWithPercentages(): List[(UserAggregateExercises, PercentagesCompleted)] = {
    val userTotals = eachUserTotals()
    val sortedByPercentage = userTotals.map { userTotal =>
      import controllers.handlers.PercentageCalculator._
      val percentagesCompleted = PercentagesCompleted(
        exercise1PercentComplete(userTotal.reps1),
        exercise2PercentComplete(userTotal.reps2),
        exercise3PercentComplete(userTotal.reps3),
        exercise4PercentComplete(userTotal.reps4),
        calculateOverallPercentComplete(userTotal))

      (userTotal, percentagesCompleted)
    }.filter { userTotal =>
      userTotal._2.anythingComplete
    }.sortBy {
      _._2.overallPercent
    }.reverse

    //for anyone who has taken the shot, we need to sort by the date of the shot taken
    val completionSplit = sortedByPercentage.partition {
      case (userAggregate, percentages) =>
        userAggregate.dateShotTaken.isDefined
    }

    val completedSortedByDateShotTaken = completionSplit._1.sortBy {
      case (userAggregate, percentages) =>
        //use the date if present, or something is wrong
        userAggregate.dateShotTaken.getOrElse {
          logger.error(s"After splitting out people that took a shot, could not find the date the shot was taken for user ${userAggregate.userId}")
          val futureCal = Calendar.getInstance()
          futureCal.set(Calendar.YEAR, futureCal.get(Calendar.YEAR) + 10)
          futureCal
        }
    }

    completedSortedByDateShotTaken ++ completionSplit._2
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
        new UserAggregateExercises(eachUser, userDailyTotal, dayEarliestShotTaken(entriesForUser))
      }
      eachDay -> userToDailyTotals
    }
    val sortedDailyEntries = dailyEntryTotals.sortBy(calendarAndMap => calendarAndMap._1.getTimeInMillis)
    SortedMap(sortedDailyEntries:_*)
  }

  /**
   * Find the best progress by someone on a given.
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

  def bestExercise1Yesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.reps1))
  def bestExercise2Yesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.reps2))
  def bestExercise3Yesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.reps3))
  def bestExercise4Yesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(_.reps4))

  def bestOverallProgressYesterday(): UserAggregateExercises = bestProgressOnDay(getYesterday, findTheGreatestOf(
    PercentageCalculator.calculateOverallPercentComplete(_)
  ))

  def everyoneTotalsForAllDays(): AnonymousAggregateExercises = {
    val allEntries = ExerciseEntries.getAll()
    sumEntries(allEntries)
  }

  def everyoneBestDay(): (Calendar, AnonymousAggregateExercises) = {
    everyoneTotalsPerDay.toList.sortBy {
      case (day: Calendar, totals: AnonymousAggregateExercises) =>
        -PercentageCalculator.calculateOverallPercentComplete(totals)
    }.headOption.getOrElse {
      (Calendar.getInstance(), new AnonymousAggregateExercises(0, 0, 0, 0.0))
    }
  }

  def everyoneTotalsPerDay: SortedMap[Calendar, AnonymousAggregateExercises] = {
    val userTotalsPerDay = totalsPerDayPerUser()
    userTotalsPerDay.map {
      case (day: Calendar, userTotals: List[UserAggregateExercises]) =>
        (day, sumUserTotals(userTotals))
    }
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

  def bestOverallProgressAnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(PercentageCalculator.calculateOverallPercentComplete(_)))
  //TODO fix this up to find based on exercise type, not specific placement in the user aggregates
  def bestExercise1AnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.reps1))
  def bestExercise2AnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.reps2))
  def bestExercise3AnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.reps3))
  def bestExercise4AnyDay(): (Calendar, UserAggregateExercises) = bestProgressAnyDay(findTheGreatestOf(_.reps4))

}
