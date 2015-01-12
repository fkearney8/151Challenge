package controllers

import play.api._
import play.api.mvc._

import forms.LoginForm
import models.{User, Users}
import utils.authentication._

object LoginController extends BaseController {
  
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
          case AuthenticationResult(Some(user), true) =>
            val redirect = request.session.get(LOGIN_REFERRER).getOrElse("/")
            Redirect(redirect).withSession(
              request.session - LOGIN_REFERRER +
              (UserAuthenticator.USERNAME_SESSION_KEY -> user.username))
          case AuthenticationResult(None, _) =>
            Ok("User " + username + " does not exist.")
          case AuthenticationResult(_, false) =>
            Ok("Password is not correct")
        }
      case _ => BadRequest("Something went wrong, no login info posted")
    }
  }

  def logout() = Action { implicit request =>
    Redirect("/login").withNewSession
  }

}
