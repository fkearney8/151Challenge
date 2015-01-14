package controllers.handlers

import models.ExerciseType

object OneFiveOneConstants {
  val TOTAL_SIT_UPS = 3051
  val TOTAL_LUNGES = 2051
  val TOTAL_BURPEES = 1051
  val TOTAL_MILES = 151
  val TOTAL_SHOTS = 1

  def exerciseTypeToTotalsMap(): Map[ExerciseType.Value, Int] = {
    Map(ExerciseType.SitUps -> TOTAL_SIT_UPS,
        ExerciseType.Lunges -> TOTAL_LUNGES,
        ExerciseType.Burpees -> TOTAL_BURPEES,
        ExerciseType.Miles -> TOTAL_MILES,
        ExerciseType.Shot -> TOTAL_SHOTS)
  }
}
