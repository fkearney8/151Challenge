package models

import java.util.Date

case class ExerciseEntry(exerciseType: ExerciseType.Value, reps: Double, when: Date, comment: String)

object ExerciseType extends Enumeration {
  val SitUps, Lunges, Burpees, Miles, Shot = Value
}
