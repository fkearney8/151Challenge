package models

import java.util.Calendar

import controllers.handlers._

import scala.collection.immutable.SortedMap

class UserStats(val id: Int) {
  val user = Users.findById(id).getOrElse(throw new BadRequestException("User " + id + " does not exist", null))

  val userDataPerDay = userDataByDay(id)

  import AggregateDataHelper.bestDayOf
  import AggregateDataHelper.findTheGreatestOf

  def bestOverallProgressAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(
    findTheGreatestOf(PercentageCalculator.calculateOverallPercentComplete(_)), userDataPerDay)
  def bestSitUpsAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.sitUps), userDataPerDay)
  def bestLungesAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.lunges), userDataPerDay)
  def bestBurpeesAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.burpees), userDataPerDay)
  def bestMilesAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.miles), userDataPerDay)

  private def userDataByDay(id: Int): SortedMap[Calendar, UserAggregateExercises] = {
    val allUsers = EveryoneTotals.totalsPerDayPerUser()

    allUsers.flatMap {
      case (day, allUsersTotalsList) =>
        val thisUserTotalsList = allUsersTotalsList.filter(_.userId == id)
        //there should be a max of one total for the user for that day
        assert(thisUserTotalsList.size <= 1, "User had more than one total entry for a day. Something is wrong with the data aggregation.")
        thisUserTotalsList.headOption.map {userDailyTotal => day -> userDailyTotal}
    }
  }
}
