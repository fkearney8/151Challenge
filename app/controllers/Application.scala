package controllers

import controllers.handlers.{OneFiveOneUtils, ViewProgressHandler, AddExerciseHandler}
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
    val eachUserTotalsWPercentages = ViewProgressHandler.eachUserTotalsWithPercentages()
    Ok(views.html.leaderboard(eachUserTotalsWPercentages, OneFiveOneUtils.printableDate(ViewProgressHandler.getYesterday),
        ViewProgressHandler.bestProgressYesterday(),
        ViewProgressHandler.bestSitUpsYesterday(), ViewProgressHandler.bestLungesYesterday(), ViewProgressHandler.bestBurpeesYesterday(),
        ViewProgressHandler.bestMilesYesterday()))
  }

  def addExerciseEntry() = isAuthenticated { username => implicit request =>
    AddExerciseHandler.addExerciseEntry
  }

  def visualizations() = Action { implicit request =>
    Ok(views.html.visualizations())
  }
}
