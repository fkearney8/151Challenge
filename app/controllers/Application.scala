
package controllers

import models.{ExerciseEntries, ExerciseEntry, Login, Users}
import play.api.data.{Form, FormError}
import play.api.mvc._
import utils.authentication.{AuthenticationResult, UserAuthenticator}

object Application extends Controller {

  def index = Action { implicit request =>
    Ok{views.html.index()}
  }

  def recordExercise = isAuthenticated { username => implicit request =>
    Ok(views.html.recordExercise(ExerciseEntries.exerciseEntryForm))
  }

  def displayEntries = isAuthenticated { username => implicit request =>
    Ok(views.html.displayEntries())
  }

  def viewProgress = isAuthenticated { username => implicit request =>
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

  private val LOGIN_REFERRER: String = "loginReferrer"

  def isAuthenticated(f: => String => Request[AnyContent] => Result): EssentialAction = {
    def userInfo(rh: RequestHeader): Option[String] = { UserAuthenticator.getAuthenticatedUser(rh) }

    def onUnauthorized(rh: RequestHeader): Result = {
      Redirect("/login").withSession(rh.session + (LOGIN_REFERRER, rh.uri))
    }

    Security.Authenticated(userInfo, onUnauthorized) { user =>
      Action(request => f(user)(request))
    }
  }

}