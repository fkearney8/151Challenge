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
    //get the last 8 days (to include today) but then strip today.
    val everyoneTotalsLastWeek = EveryoneTotals.everyoneTotalsPerDay.takeRight(8).take(7)
    val recentDays = everyoneTotalsLastWeek.map { case (day, _) =>
      OneFiveOneDateUtils.printableDateShort(day)
    }
    val recentData = everyoneTotalsLastWeek.map { case (_, totals) =>
      PercentageCalculator.calculateOverallPercentComplete(totals)
    }

    Ok{views.html.index(Json.toJson(recentDays), Json.toJson(recentData))}
  }

  def history = Action { implicit request =>
    Ok{views.html.history()}
  }

  def rules = Action { implicit request =>
    Ok{views.html.rules()}
  }

  def recordExercise = isAuthenticated { username => implicit request =>
    Ok(views.html.recordExercise(ExerciseEntriesForm.exerciseEntryForm))
  }

  def addExerciseEntry() = isAuthenticated { username => implicit request =>
    AddExerciseHandler.addExerciseEntry
  }

  def displayEntries = isAuthenticated { username => implicit request =>
    val allEntries = ExerciseEntries.getAllForUser(UserAuthenticator.getAuthenticatedUser.get.id)
    Ok(views.html.displayEntries(allEntries))
  }

  def leaderboard = isAuthenticated { username => implicit request =>
    Ok(views.html.leaderboard())
  }

  def editExerciseEntry() = isAuthenticated { username => implicit request =>
    EditExerciseHandler.editExerciseEntry
  }

  def doEditExerciseEntry() = isAuthenticated { username => implicit request =>
    EditExerciseHandler.commitExerciseEntryChanges
  }

  def visualizations() = Action { implicit request =>
    Ok(views.html.visualizations())
  }

  def userPage(id: Int) = Action { implicit request =>
    val userAggregateData = new UserStats(id)
    Ok(views.html.userPage(userAggregateData))
  }
}
