
package controllers

import models.{ExerciseEntry, ExerciseEntries, Login, Users}
import play.api._
import play.api.data.{FormError, Form}
import play.api.libs.json.Json
import play.api.mvc.Security.AuthenticatedBuilder
import play.api.mvc._
import play.twirl.api.HtmlFormat
import utils.authentication.{AuthenticationResult, UserAuthenticator}

object Application extends Controller {

  private val USERNAME_SESSION_KEY: String = "username"

  def getAuthenticatedUser(request: RequestHeader): Option[String] = {
    request.session.get(USERNAME_SESSION_KEY)
  }

  def index = Action { implicit request =>
    Ok{views.html.index()}
  }

  def recordExercise = Action { implicit request =>
    Ok(views.html.recordExercise(ExerciseEntries.exerciseEntryForm))
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
        val authResult = UserAuthenticator.authenticateUser(username, password)
        authResult match {
          case AuthenticationResult(true, true) =>
            Ok("Got login for " + username + " with password " + password)
                .withSession(request.session + (USERNAME_SESSION_KEY, username))
          case AuthenticationResult(false, _) =>
            Ok("User " + username + " does not exist.")
          case AuthenticationResult(_, false) =>
            Ok("Password is not correct")
        }
      case _ => BadRequest("Something went wrong, no login info posted")
    }
  }

  def addExerciseEntry() = Action { implicit request =>
    val formInfo: Form[ExerciseEntry] = ExerciseEntries.exerciseEntryForm.bindFromRequest()
    if (formInfo.errors.nonEmpty) {
      BadRequest {
        val formErrorString = formInfo.errors.foldLeft("")((aggregateString: String, eachError: FormError) => {
          aggregateString + " " + eachError.message
        })
        "There were problems with your submission: " + formErrorString
      }
    } else {
      val formData = formInfo.get
      val errorString = ExerciseEntries.validateEntry(formData)
      errorString.fold(Ok("Exercise has been Recorded"))(BadRequest(_))
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