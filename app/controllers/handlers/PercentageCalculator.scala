package controllers.handlers

import OneFiveOneConstants._

object PercentageCalculator {

  /** Given an aggregate of user exercises, determine how much of a completion percentage was done for that aggregate of exercise counts.
    *
    * Note these percentages are already normalized to 0-100 values rather than 0-1*/
  def calculateOverallPercentComplete(aggregateExercises: AggregateExercises): Double= {
    val totalPercentages = (sitUpsPercentComplete(aggregateExercises.sitUps)
        + lungesPercentComplete(aggregateExercises.lunges)
        + burpeesPercentComplete(aggregateExercises.burpees)
        + milesPercentComplete(aggregateExercises.miles))
    roundToTwoDecimalPoints(totalPercentages / 4.0)
  }

  def sitUpsPercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / TOTAL_SIT_UPS))
  def lungesPercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / TOTAL_LUNGES))
  def burpeesPercentComplete(repsDone: Int): Double = capAt100Percent(doubleToPercentage(repsDone.toDouble / TOTAL_BURPEES))
  def milesPercentComplete(repsDone: BigDecimal): Double = capAt100Percent(doubleToPercentage((repsDone / TOTAL_MILES).toDouble))

  private def doubleToPercentage(rawPercentage: Double): Double = Math.round(rawPercentage * 10000.0) / 100.0
  private def roundToTwoDecimalPoints(raw: Double): Double = Math.round(raw * 100.0) / 100.0
  private def capAt100Percent(percentage: Double): Double = if (percentage > 100.0) 100.0 else percentage
}
