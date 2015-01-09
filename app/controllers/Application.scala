
package controllers

import models.Users
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

  def index = Action {
    implicit val user = Option("hi")
    Ok(views.html.index())
  }

  def recordExercise= Action {
    Ok(views.html.recordExercise())
  }

  def displayEntries = Action {
    Ok(views.html.displayEntries())
  }

  def viewProgress = Action { request =>
    Ok(views.html.viewProgress())
        //TODO cheating for now and just logging in as 'Theresa' when someone goes to the view progress page
        .withSession(request.session + (USERNAME_SESSION_KEY, "Theresa"))
  }

  def login() = Action { implicit request =>
    Ok(views.html.loginPage(Users.findAll))
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

  def showAuthPage = Action { request =>
    Ok(views.html.titlebar(getAuthenticatedUser(request)))
  }


}