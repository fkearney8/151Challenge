package controllers.handlers

import java.util.Calendar

import models._
import utils.Exercises
import utils.Exercises.{Exercise, Shot}

import scala.collection.immutable.SortedMap

/**
 * Methods to help aggregate and find interesting data elements.
 */
object AggregateDataHelper {

  def sumEntries(entriesToSum: List[ExerciseEntry]): AnonymousAggregateExercises = {
    val totaledEntries = entriesToSum.foldLeft{Map.empty[Exercise, BigDecimal]} {
        (runningTotals: Map[Exercise, BigDecimal], exerciseEntry: ExerciseEntry) => {

          val exerciseType = exerciseEntry.exerciseType
          val currentAmount = runningTotals.getOrElse(exerciseType, BigDecimal(0))
          runningTotals + (exerciseType -> (currentAmount + exerciseEntry.reps))
        }
    }
    new AnonymousAggregateExercises(totaledEntries)
  }

  def bestProgressOf(entries: List[UserAggregateExercises],
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

  def sumUserTotals(userTotalsList: Seq[UserAggregateExercises]): AnonymousAggregateExercises = {
    userTotalsList.foldLeft(new AnonymousAggregateExercises(0, 0, 0, 0.0)) {
      (runningTotals: AnonymousAggregateExercises, userTotals: UserAggregateExercises) =>
        new AnonymousAggregateExercises(runningTotals.reps1 + userTotals.reps1,
          runningTotals.reps2 + userTotals.reps2,
          runningTotals.reps3 + userTotals.reps3,
          runningTotals.reps4 + userTotals.reps4)
    }
  }

  /** Find the best day of the days data given. 'Best' is defined as the first (least) UserAggregateData given the sorterLt. */
  def bestDayOf(sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean,
                dailyTotals: SortedMap[Calendar, UserAggregateExercises]):
  (Calendar, UserAggregateExercises) = {

    dailyTotals.toList.sortWith { (calAndUae1: (Calendar, UserAggregateExercises), calAndUae2: (Calendar, UserAggregateExercises)) =>
      sorterLt(calAndUae1._2, calAndUae2._2)
    }.headOption.getOrElse {
      //if nothing else, today with 0 progress is best
      (Calendar.getInstance(), new UserAggregateExercises(0, "No One", 0, 0, 0, 0.0))
    }
  }

  def dayEarliestShotTaken(entries: List[ExerciseEntry]): Option[Calendar] = {
     //filter to entries for Shots, sort by date
     val shotsTaken = entries.filter(_.exerciseType.name == Shot.name)
     shotsTaken.sortBy(_.when).headOption.map(_.when)
   }
}

case class UserAggregateExercises(userId: Int, username: String,
                                  reps1: Int, reps2: Int, reps3: Int, reps4: BigDecimal, dateShotTaken: Option[Calendar] = None)
  extends AggregateExercises {
  def this(user: User, aggregateExercises: AnonymousAggregateExercises, dateShotTaken: Option[Calendar]) {
    this(user.id, user.username, aggregateExercises.reps1, aggregateExercises.reps2, aggregateExercises.reps3, aggregateExercises.reps4, dateShotTaken)
  }
}

case class AnonymousAggregateExercises(reps1: Int, reps2: Int, reps3: Int, reps4: BigDecimal) extends AggregateExercises {
  def this(totalsMap: Map[Exercise, BigDecimal]) {
    this(totalsMap.getOrElse(Exercises.yearsExercises._1, BigDecimal(0)).toInt,
        totalsMap.getOrElse(Exercises.yearsExercises._2, BigDecimal(0)).toInt,
        totalsMap.getOrElse(Exercises.yearsExercises._3, BigDecimal(0)).toInt,
        totalsMap.getOrElse(Exercises.yearsExercises._4, BigDecimal(0)))
  }
}

//TODO change these to store a map of exercises to counts, rather than specific totals in position
trait AggregateExercises {
  def reps1: Int
  def reps2: Int
  def reps3: Int
  def reps4: BigDecimal
}

case class PercentagesCompleted(ex1Percent: BigDecimal,
                                ex2Percent: BigDecimal,
                                ex3Percent: BigDecimal,
                                ex4Percent: BigDecimal,
                                overallPercent: BigDecimal) {
  def anythingComplete: Boolean = {
    overallPercent != BigDecimal(0)
  }
}

