package utils.authentication

import play.api.libs.Crypto
import play.api.mvc.{AnyContent, Request, RequestHeader}

import models.{User, Users}

object UserAuthenticator {

  val USERNAME_SESSION_KEY: String = "username"

  def authenticateUser(username: String, password: String): AuthenticationResult = {
    //retrieve the user and check the password signature from the database
    val passwordSig = Crypto.sign(password)
    Users.findByLoginIdentifier(username) match {
      case Some(user) =>
        AuthenticationResult(Some(user), user.password == passwordSig)
      case None =>
        AuthenticationResult(None, false)
    }
  }

  def getAuthenticatedUsername(implicit request: RequestHeader): Option[String] = {
    request.session.get(USERNAME_SESSION_KEY)
  }

  def getAuthenticatedUser(implicit request: RequestHeader): Option[User] = {
    getAuthenticatedUsername(request)
      .map { usernameString => Users.findByUsername(usernameString).get }
  }
}

case class AuthenticationResult(user: Option[User], authenticated: Boolean)
