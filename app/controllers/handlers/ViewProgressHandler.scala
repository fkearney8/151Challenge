package controllers.handlers

import models._

object ViewProgressHandler {

  def eachUserTotals(): List[UserAggregateExercises] = {
    //retrieve each user
    val allUsers = Users.findAll

    allUsers.map{(eachUser) =>
      val entriesPerUser = ExerciseEntries.getAllForUser(eachUser.id)
      val totalsMap = sumEntries(entriesPerUser)
      new UserAggregateExercises(eachUser, totalsMap)
    }
  }

  def eachUserTotalsWithPercentages(): List[(UserAggregateExercises, PercentagesCompleted)] = {
    val userTotals = eachUserTotals()
    userTotals.map{userTotal =>
      import PercentageCalculator._
      val percentagesCompleted = PercentagesCompleted(
        sitUpsPercentComplete(userTotal.situps),
        lungesPercentComplete(userTotal.lunges),
        burpeesPercentComplete(userTotal.burpees),
        milesPercentComplete(userTotal.miles),
        calculateOverallPercentComplete(userTotal)
      )
      (userTotal, percentagesCompleted)
    }.sortBy{overallPercentageOrdering}.reverse
  }

  def overallPercentageOrdering(totalAndPercentages: (UserAggregateExercises, PercentagesCompleted)): BigDecimal = {
    totalAndPercentages._2.overallPercent
  }

  def sumEntries(entriesPerUser: List[ExerciseEntry]): Map[ExerciseType.Value, BigDecimal] = {
    val totalsForUser = entriesPerUser.foldLeft{Map.empty[ExerciseType.Value, BigDecimal]} {
        (runningTotals: Map[ExerciseType.Value, BigDecimal], exerciseEntry: ExerciseEntry) => {
      val exerciseType: ExerciseType.Value = exerciseEntry.exerciseType
      val currentAmount = runningTotals.getOrElse(exerciseType, BigDecimal(0))
      runningTotals + (exerciseType -> (currentAmount + exerciseEntry.reps))
    }}
    totalsForUser
  }
}

case class UserAggregateExercises(userId: Int, username: String, situps: Int, lunges: Int, burpees: Int, miles: BigDecimal) {
  def this(user: User, totalsMap: Map[ExerciseType.Value, BigDecimal]) {
    this(user.id, user.username,
      totalsMap.getOrElse(ExerciseType.SitUps, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Lunges, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Burpees, BigDecimal(0)).toInt,
      totalsMap.getOrElse(ExerciseType.Miles, BigDecimal(0))
    )
  }
}

case class PercentagesCompleted(sitUpsPercent: BigDecimal, lungesPercent: BigDecimal, burpeesPercent: BigDecimal, milesPercent: BigDecimal, overallPercent: BigDecimal)

