package controllers

import controllers.handlers.AddExerciseHandler
import play.api._
import play.api.data.{Form, FormError}
import play.api.mvc._
import play.api.libs.json.Json
import play.api.mvc.Security.AuthenticatedBuilder

import forms.{LoginForm, ExerciseEntriesForm}
import models.{User, ExerciseEntries, Users}
import utils.authentication.{AuthenticationResult, UserAuthenticator}

object Application extends Controller {

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

  def login() = Action { implicit request =>
    val allUsers: List[User] = Users.findAll
    Ok(views.html.loginPage(LoginForm.loginForm)(allUsers))
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
    def userInfo(request: RequestHeader): Option[String] = { UserAuthenticator.getAuthenticatedUsername(request) }

    def onUnauthorized(request: RequestHeader): Result = {
      Redirect("/login").withSession(request.session + (LOGIN_REFERRER, request.uri))
    }

    Security.Authenticated(userInfo, onUnauthorized) { user =>
      Action(request => f(user)(request))
    }
  }

}
