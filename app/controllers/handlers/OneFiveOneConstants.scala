package controllers.handlers

import java.util.Calendar

import controllers.handlers.OneFiveOneDateUtils._
import utils.ChallengeYears


object OneFiveOneConstants {
  //TODO move this into the exercises enumeration
  val EXERCISE_1_REPS = 3051
  val EXERCISE_2_REPS = 2051
  val EXERCISE_3_REPS = 1051
  val EXERCISE_4_REPS = 151
  val TOTAL_SHOTS = 1

  val START_OF_CHALLENGE = {
    val startOfChallenge = Calendar.getInstance()
    startOfChallenge.set(Calendar.YEAR, ChallengeYears.ThisYear.yearString.toInt)
    startOfChallenge.set(Calendar.MONTH, Calendar.JANUARY)
    startOfChallenge.set(Calendar.DAY_OF_MONTH, 15)
    roundToDay(startOfChallenge)
    startOfChallenge
  }

}
