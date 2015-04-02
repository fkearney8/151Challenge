package models

import java.util.Calendar

import controllers.handlers._
import play.api.libs.json.{JsObject, JsValue, Json}

import scala.collection.immutable.SortedMap

import AggregateDataHelper.bestDayOf
import AggregateDataHelper.findTheGreatestOf

class UserStats(val id: Int) {
  val user = Users.findById(id).getOrElse(throw new BadRequestException("User " + id + " does not exist", null))

  val userDataPerDay = userDataByDay(id)

  def bestOverallProgressAnyDay(): (Calendar, UserAggregateExercises) = bestDayOf(
    findTheGreatestOf(PercentageCalculator.calculateOverallPercentComplete(_)), userDataPerDay)
  def bestExercise1Day(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.reps1), userDataPerDay)
  def bestExercise2Day(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.reps2), userDataPerDay)
  def bestExercise3Day(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.reps3), userDataPerDay)
  def bestExercise4Day(): (Calendar, UserAggregateExercises) = bestDayOf(findTheGreatestOf(_.reps4), userDataPerDay)

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

  def overallGraphJson: JsObject = {
    val graphDays = userDataPerDay.map { case (day, totals) =>
      OneFiveOneDateUtils.printableDateShort(day)
    }
    val graphData = userDataPerDay.map { case (day, totals) =>
      PercentageCalculator.calculateOverallPercentComplete(totals)
    }

    Json.obj(
      "days" -> Json.toJson(graphDays),
      "data" -> Json.toJson(graphData))
  }

}
