package controllers.handlers

import org.junit.runner.RunWith
import org.specs2.mutable.Specification
import org.specs2.runner.JUnitRunner

@RunWith(classOf[JUnitRunner])
class PercentageCalculatorSpec extends Specification {

  "Percentage Calculator" should {
    "cap percentages at 100 percent" in {
      PercentageCalculator.exercise1PercentComplete(5600) must be equalTo 100.0
      PercentageCalculator.exercise2PercentComplete(10500) must be equalTo 100.0
      PercentageCalculator.exercise3PercentComplete(1500) must be equalTo 100.0
      PercentageCalculator.exercise4PercentComplete(1500) must be equalTo 100.0

      PercentageCalculator.calculateOverallPercentComplete(UserAggregateExercises(1, "Frank", 10000, 9000, 8000, 1000)) must be equalTo 100.0
    }
  }
}
