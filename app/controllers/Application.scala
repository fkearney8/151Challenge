package controllers

import play.api._
import play.api.mvc._

object Application extends Controller {

  def index = Action {
    Ok(views.html.index("151 Challenge"))
  }

  def recordExercise= Action {
    Ok(views.html.recordExercise())
  }

  def displayEntries = Action {
    Ok(views.html.displayEntries())
  }
}