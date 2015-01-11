
package controllers

import controllers.handlers.AddExerciseHandler
import forms.{LoginForm, ExerciseEntriesForm}
import models.Users
import play.api.data.{Form, FormError}
import play.api.mvc._
import utils.authentication.{AuthenticationResult, UserAuthenticator}

object Application extends Controller {

  def index = Action { implicit request =>
    Ok{views.html.index()}
  }

  def recordExercise = isAuthenticated { username => implicit request =>
    Ok(views.html.recordExercise(ExerciseEntriesForm.exerciseEntryForm))
  }

  def displayEntries = isAuthenticated { username => implicit request =>
    Ok(views.html.displayEntries())
  }

  def viewProgress = isAuthenticated { username => implicit request =>
    Ok(views.html.viewProgress())
  }

  def login() = Action { implicit request =>
    Ok(views.html.loginPage(LoginForm.loginForm)(Users.findAll))
  }

  def loginAction() = Action { implicit request =>
    val loginInfo = LoginForm.loginForm.bindFromRequest().get
    loginInfo match {
      case (username, password) =>
        val authResult = UserAuthenticator.authenticateUser(username, password)
        authResult match {
          case AuthenticationResult(true, true) =>
            val redirect = request.session.get(LOGIN_REFERRER).getOrElse("/")
            Redirect(redirect).withSession(request.session - LOGIN_REFERRER + (UserAuthenticator.USERNAME_SESSION_KEY, username))
          case AuthenticationResult(false, _) =>
            Ok("User " + username + " does not exist.")
          case AuthenticationResult(_, false) =>
            Ok("Password is not correct")
        }
      case _ => BadRequest("Something went wrong, no login info posted")
    }
  }

  def addExerciseEntry() = isAuthenticated { username => implicit request =>
    AddExerciseHandler.addExerciseEntry
  }

  def logout() = Action { implicit request =>
    Redirect("/login").withNewSession
  }

  private val LOGIN_REFERRER: String = "loginReferrer"

  def isAuthenticated(f: => String => Request[AnyContent] => Result): EssentialAction = {
    def userInfo(rh: RequestHeader): Option[String] = { UserAuthenticator.getAuthenticatedUsername(rh) }

    def onUnauthorized(rh: RequestHeader): Result = {
      Redirect("/login").withSession(rh.session + (LOGIN_REFERRER, rh.uri))
    }

    Security.Authenticated(userInfo, onUnauthorized) { user =>
      Action(request => f(user)(request))
    }
  }

}