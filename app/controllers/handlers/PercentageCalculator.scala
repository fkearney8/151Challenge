package controllers.handlers

import OneFiveOneConstants._

object PercentageCalculator {

  /** Given an aggregate of user exercises, determine how much of a completion percentage was done for that aggregate of exercise counts.
    *
    * Note these percentages are already normalized to 0-100 values rather than 0-1*/
  def calculateOverallPercentComplete(aggregateExercises: UserAggregateExercises): Double= {
    val totalPercentages = (sitUpsPercentComplete(aggregateExercises.situps)
        + lungesPercentComplete(aggregateExercises.lunges)
        + burpeesPercentComplete(aggregateExercises.burpees)
        + milesPercentComplete(aggregateExercises.miles))
    roundToTwoDecimalPoints(totalPercentages / 4.0)
  }

  def sitUpsPercentComplete(repsDone: Int): Double = doubleToPercentage(repsDone.toDouble / TOTAL_SIT_UPS)
  def lungesPercentComplete(repsDone: Int): Double = doubleToPercentage(repsDone.toDouble / TOTAL_LUNGES)
  def burpeesPercentComplete(repsDone: Int): Double = doubleToPercentage(repsDone.toDouble / TOTAL_BURPEES)
  def milesPercentComplete(repsDone: BigDecimal): Double = doubleToPercentage((repsDone / TOTAL_MILES).toDouble)

  def doubleToPercentage(rawPercentage: Double): Double = Math.round(rawPercentage * 10000.0) / 100.0
  def roundToTwoDecimalPoints(raw: Double): Double = Math.round(raw * 100.0) / 100.0
}
