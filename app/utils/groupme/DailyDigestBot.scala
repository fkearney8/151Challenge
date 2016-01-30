package utils.groupme

import java.util.Calendar

import controllers.handlers.{PercentageCalculator, EveryoneTotals}
import utils.Exercises
import utils.Exercises.Exercise

object DailyDigestBot {
  val prefix = "151 Daily Digest:\n\nBest stats from yesterday:\n"
  val suffix = "\n\nCongratulations, See you tomorrow!"
  //TODO this could make nice use of a dependency injection framework for use in tests... say just log it to the console if we get the test bot
  lazy val bot = new GroupMePoster(sys.env.get("GROUPME_BOT_ID"), sys.env.get("GROUPME_URL"))
}

/**
  * Class to create a daily digest report and post it to GroupMe.
  */
class DailyDigestBot() {
  import DailyDigestBot._

  def postReport: Unit = {
    val report = runReport
    //post it
    bot.post(report)
  }

  def runReport: String = {
    val bestExercise1Yesterday = EveryoneTotals.bestExercise1Yesterday()
    val bestExercise2Yesterday = EveryoneTotals.bestExercise2Yesterday()
    val bestExercise3Yesterday = EveryoneTotals.bestExercise3Yesterday()
    val bestExercise4Yesterday = EveryoneTotals.bestExercise4Yesterday()
    val bestOverallProgressYesterday = EveryoneTotals.bestOverallProgressYesterday()

    val exercises = Exercises.exercisesForYear()
    //create a report string
    val bestExercise1String = stringifyResults(exercises._1, bestExercise1Yesterday.username, bestExercise1Yesterday.reps1)
    val bestExercise2String = stringifyResults(exercises._2, bestExercise2Yesterday.username, bestExercise2Yesterday.reps2)
    val bestExercise3String = stringifyResults(exercises._3, bestExercise3Yesterday.username, bestExercise3Yesterday.reps3)
    val bestExercise4String = stringifyResults(exercises._4, bestExercise4Yesterday.username, bestExercise4Yesterday.reps4)
    val bestOverallString = s"Best overall day yesterday was ${bestOverallProgressYesterday.username} with ${PercentageCalculator.calculateOverallPercentComplete(bestOverallProgressYesterday)}%"

    val exercisesResults = List(bestExercise1String, bestExercise2String, bestExercise3String, bestExercise4String, bestOverallString)

    prefix + exercisesResults.mkString("\n") + suffix
  }

  private def stringifyResults(exType: Exercise, username: String, reps: BigDecimal): String = {
    s"${exType.displayName} - $username with $reps reps."
  }

}
