package utils

import utils.ChallengeYears._

object Exercises {

  //TODO this will only work as long as there are 5 things. Deprecate in favor of the list
  //to make it easy to get this year's stuff
  val yearsExercises = exercisesForYear()
  def exercisesForYear(year: ChallengeYear = ThisYear) = {
    year match {
      case Year2015 => (SitUps, Lunges, Burpees, Miles, Shot)
      case Year2016 => (AirSquats, PushUps, Planks, Miles, Shot)
      case Year2017 => (MountainClimbers, TricepDips, VeeUps, Miles, Shot)
      case ThisYear => (MountainClimbers, TricepDips, VeeUps, Miles, Shot)
    }
  }

  def exercisesForYearList(year: ChallengeYear = ThisYear): List[Exercise] =
      List(exercisesForYear(year)._1, exercisesForYear(year)._2, exercisesForYear(year)._3, exercisesForYear(year)._4, exercisesForYear(year)._5)

  private val allExercises: Seq[Exercise] = List(SitUps, Lunges, Burpees, Miles, Shot, PushUps, AirSquats, Planks, MountainClimbers, TricepDips, VeeUps, UpperBody, Core, LowerBody)


  sealed abstract class Exercise(val name: String, val displayName: String)

  object Exercise {
    def withName(name: String): Exercise = {
      allExercises.find(eachExercise => eachExercise.name == name).getOrElse {
        throw new IllegalArgumentException(s"Attempt to find exercise named $name")
      }
    }
  }

  case object Miles extends Exercise("Miles", "Miles")
  case object Shot extends Exercise("Shot", "Shot")

  case object SitUps extends Exercise("SitUps", "Sit Ups")
  case object Lunges extends Exercise("Lunges", "Lunges")
  case object Burpees extends Exercise("Burpees", "Burpees")

  case object PushUps extends Exercise("PushUps", "Push Ups")
  case object AirSquats extends Exercise("AirSquats", "Air Squats")
  case object Planks extends Exercise("Planks", "Planks")

  case object MountainClimbers extends Exercise("MountainClimbers", "Mountain Climbers")
  case object TricepDips extends Exercise("TricepDips", "Tricep Dips")
  case object VeeUps extends Exercise("VeeUps", "V-Ups")

  case object UpperBody extends Exercise("UpperBody", "Upper Body")
  case object Core extends Exercise("Core", "Core")
  case object LowerBody extends Exercise("LowerBody", "Lower Body")
}

