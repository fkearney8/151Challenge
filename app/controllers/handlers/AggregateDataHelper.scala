package controllers.handlers

import java.util.Calendar

import controllers.handlers.OneFiveOneDateUtils._
import models._
import play.api.Logger

import scala.collection.immutable.SortedMap

/**
 * Methods to help aggregate and find interesting data elements.
 */
object AggregateDataHelper {

  def sumEntries(entriesToSum: List[ExerciseEntry]): AnonymousAggregateExercises = {
    val totaledEntries = entriesToSum.foldLeft{Map.empty[ExerciseType.Value, BigDecimal]} {
        (runningTotals: Map[ExerciseType.Value, BigDecimal], exerciseEntry: ExerciseEntry) => {
      val exerciseType: ExerciseType.Value = exerciseEntry.exerciseType
      val currentAmount = runningTotals.getOrElse(exerciseType, BigDecimal(0))
      runningTotals + (exerciseType -> (currentAmount + exerciseEntry.reps))
    }}
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
        new AnonymousAggregateExercises(runningTotals.sitUps + userTotals.sitUps,
          runningTotals.lunges + userTotals.lunges,
          runningTotals.burpees + userTotals.burpees,
          runningTotals.miles + userTotals.miles)
    }
  }

  /** Find the best day of the days data given. 'Best' is defined as the first (least) UserAggregateData given the sorterLt. */
  def bestDayOf(sorterLt: (UserAggregateExercises, UserAggregateExercises) => Boolean, dailyTotals: SortedMap[Calendar, UserAggregateExercises]): (Calendar, UserAggregateExercises) = {
    dailyTotals.toList.sortWith { (calAndUae1: (Calendar, UserAggregateExercises), calAndUae2: (Calendar, UserAggregateExercises)) =>
      sorterLt(calAndUae1._2, calAndUae2._2)
    }.head
  }

  def dayEarliestShotTaken(entries: List[ExerciseEntry]): Option[Calendar] = {
     //filter to entries for Shots, sort by date
     val shotsTaken = entries.filter(_.exerciseType == ExerciseType.Shot)
     shotsTaken.sortBy(_.when).headOption.map(_.when)
   }
}

case class UserAggregateExercises(userId: Int, username: String, sitUps: Int, lunges: Int, burpees: Int, miles: BigDecimal, dateShotTaken: Option[Calendar] = None)
  extends AggregateExercises {
  def this(user: User, aggregateExercises: AnonymousAggregateExercises, dateShotTaken: Option[Calendar]) {
    this(user.id, user.username, aggregateExercises.sitUps, aggregateExercises.lunges, aggregateExercises.burpees, aggregateExercises.miles, dateShotTaken)
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

