package controllers

import play.api._
import play.api.data.{Form, FormError}
import play.api.mvc._
import play.api.libs.json.Json

import controllers.handlers.AddExerciseHandler
import forms.ExerciseEntriesForm
import models.{User, ExerciseEntries, Users}
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

  def viewProgress = isAuthenticated { username => implicit request =>
    Ok(views.html.viewProgress())
  }

  def addExerciseEntry() = isAuthenticated { username => implicit request =>
    AddExerciseHandler.addExerciseEntry
  }

  def visualizations() = Action { implicit request =>
    Ok(views.html.visualizations())
  }
}
