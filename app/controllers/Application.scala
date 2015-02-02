package controllers

import controllers.handlers._
import forms.ExerciseEntriesForm
import models.{UserStats, ExerciseEntries}
import play.api.Logger
import play.api.libs.json.Json
import play.api.mvc._
import utils.authentication._

object Application extends BaseController {

  def index = Action { implicit request =>
    val everyoneTotalsLastWeek = EveryoneTotals.everyoneTotalsPerDay.takeRight(8).take(7)
    val recentDays = everyoneTotalsLastWeek.map { case (day, totals) =>
      OneFiveOneDateUtils.printableDateShort(day)
    }
    val recentData = everyoneTotalsLastWeek.map { case (day, totals) =>
      PercentageCalculator.calculateOverallPercentComplete(totals)
    }

    Ok{views.html.index(Json.toJson(recentDays), Json.toJson(recentData))}
  }

  def recordExercise = isAuthenticated { username => implicit request =>
    Ok(views.html.recordExercise(ExerciseEntriesForm.exerciseEntryForm))
  }

  def displayEntries = isAuthenticated { username => implicit request =>
    val allEntries = ExerciseEntries.getAllForUser(UserAuthenticator.getAuthenticatedUser.get.id)
    Ok(views.html.displayEntries(allEntries))
  }

  def leaderboard = isAuthenticated { username => implicit request =>
    Ok(views.html.leaderboard())
  }

  def addExerciseEntry() = isAuthenticated { username => implicit request =>
    AddExerciseHandler.addExerciseEntry
  }

  def visualizations() = Action { implicit request =>
    Ok(views.html.visualizations())
  }

  def userPage(id: Int) = Action { implicit request =>
    val userAggregateData = new UserStats(id)
    Ok(views.html.userPage(userAggregateData))
  }
}
