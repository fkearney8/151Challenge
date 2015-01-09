
package controllers

import models.{Login, Users}
import play.api._
import play.api.libs.json.Json
import play.api.mvc.Security.AuthenticatedBuilder
import play.api.mvc._
import play.twirl.api.HtmlFormat

object Application extends Controller {

  private val USERNAME_SESSION_KEY: String = "username"

  def getAuthenticatedUser(request: RequestHeader): Option[String] = {
    request.session.get(USERNAME_SESSION_KEY)
  }

  def index = Action { implicit request =>
    Ok{views.html.index()}
  }

  def recordExercise = Action { implicit request =>
    Ok(views.html.recordExercise())
  }

  def displayEntries = Action { implicit request =>
    Ok(views.html.displayEntries())
  }

  def viewProgress = Action { implicit request =>
    Ok(views.html.viewProgress())
  }

  def login() = Action { implicit request =>
    Ok(views.html.loginPage(Login.loginForm)(Users.findAll))
  }

  def loginAction() = Action { implicit request =>
    val loginInfo = Login.loginForm.bindFromRequest().get
    loginInfo match {
      case (username, password) =>
        //TODO Actually authenticate, hash password and check against database
        Ok("Got login for " + username + " with password " + password)
            .withSession(request.session + (USERNAME_SESSION_KEY, username))
      case _ => BadRequest("Something went wrong, no login info posted")
    }
  }

  def logout() = Action { implicit request =>
    Redirect("/login").withNewSession
  }

  def isAuthenticated(f: => String => Request[AnyContent] => Result): EssentialAction = {
    def userInfo(rh: RequestHeader): Option[String] = { rh.session.get(USERNAME_SESSION_KEY) }
    def onUnauthorized(rh: RequestHeader): Result = { Redirect("/login") }
    Security.Authenticated(userInfo, onUnauthorized) { user =>
      Action(request => f(user)(request))
    }
  }

  //then in a controller
  def authRequiredTestPage: EssentialAction = isAuthenticated { username => request =>
    Ok("This page required Auth, Hello " + username)
  }

  def showAuthPage = Action { implicit request =>
    Ok(views.html.titleBar())
  }


}