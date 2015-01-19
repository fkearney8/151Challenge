package controllers

import controllers.handlers.{OneFiveOneDateUtils, AggregateDataHandler, AddExerciseHandler}
import forms.ExerciseEntriesForm
import models.ExerciseEntries
import play.api.Logger
import play.api.mvc._
import utils.authentication._

object Application extends BaseController {

  def index = Action { implicit request =>
    Ok{views.html.index()}
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
}
