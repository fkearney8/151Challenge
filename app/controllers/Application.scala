package controllers

import models.Users
import play.api._
import play.api.libs.json.Json
import play.api.mvc._

object Application extends Controller {

  def index = Action {
    Ok(views.html.index())
  }

  def recordExercise= Action {
    Ok(views.html.recordExercise())
  }

  def displayEntries = Action {
    Ok(views.html.displayEntries())
  }

  def viewProgress = Action {
    Ok(views.html.viewProgress())
  }

  def login() = Action {
    val usersList = Users.getUsers
    Ok(views.html.loginPage() + usersList.toString())
  }
}