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
    roundToTwoDecmalPoints(totalPercentages / 4.0)
  }

  def sitUpsPercentComplete(repsDone: Double): Double = doubleToPercentage(repsDone / TOTAL_SIT_UPS)
  def lungesPercentComplete(repsDone: Double): Double = doubleToPercentage(repsDone / TOTAL_LUNGES)
  def burpeesPercentComplete(repsDone: Double): Double = doubleToPercentage(repsDone / TOTAL_BURPEES)
  def milesPercentComplete(repsDone: Double): Double = doubleToPercentage(repsDone / TOTAL_MILES)

  def doubleToPercentage(rawPercentage: Double): Double = roundToTwoDecmalPoints(rawPercentage) * 100
  def roundToTwoDecmalPoints(raw: Double): Double = Math.round(raw * 100.0) / 100.0
}
