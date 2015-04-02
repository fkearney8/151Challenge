package controllers.handlers

import OneFiveOneConstants._

object PercentageCalculator {

  /** Given an aggregate of user exercises, determine how much of a completion percentage was done for that aggregate of exercise counts.
    *
    * Note these percentages are already normalized to 0-100 values rather than 0-1*/
  def calculateOverallPercentComplete(aggregateExercises: AggregateExercises): Double= {
    val totalPercentages = (exercise1PercentComplete(aggregateExercises.reps1)
        + exercise2PercentComplete(aggregateExercises.reps2)
        + exercise3PercentComplete(aggregateExercises.reps3)
        + exercise4PercentComplete(aggregateExercises.reps4))
    roundToTwoDecimalPoints(totalPercentages / 4.0)
  }

  def exercise1PercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / EXERCISE_1_REPS))
  def exercise2PercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / EXERCISE_2_REPS))
  def exercise3PercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / EXERCISE_3_REPS))
  def exercise4PercentComplete(repsDone: BigDecimal): Double = capAt100Percent(doubleToPercentage((repsDone / EXERCISE_4_REPS).toDouble))

  private def doubleToPercentage(rawPercentage: Double): Double = Math.round(rawPercentage * 10000.0) / 100.0
  private def roundToTwoDecimalPoints(raw: Double): Double = Math.round(raw * 100.0) / 100.0
  private def capAt100Percent(percentage: Double): Double = if (percentage > 100.0) 100.0 else percentage
}
