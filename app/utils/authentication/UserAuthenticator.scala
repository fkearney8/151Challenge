package utils.authentication

import models.{User, Users}
import play.api.libs.Crypto
import play.api.mvc.{AnyContent, Request, RequestHeader}

object UserAuthenticator {

  val USERNAME_SESSION_KEY: String = "username"

  def authenticateUser(username: String, password: String): AuthenticationResult = {
    val passwordSig = Crypto.sign(password)

    //retrieve the user and check the password signature from the database
    val userOption = Users.findByEmailOrUsername("", username)
    userOption match {
      case Some(user) =>
        AuthenticationResult(true, user.password == passwordSig)
      case None => AuthenticationResult(false, false)
    }
  }

  def getAuthenticatedUsername(implicit request: RequestHeader): Option[String] = {
    request.session.get(USERNAME_SESSION_KEY)
  }

  def getAuthenticatedUser(implicit request: RequestHeader): Option[User] = {
    val username = getAuthenticatedUsername(request)
    val user: Option[User] = username.map{ usernameString =>
      Users.findByEmailOrUsername("", usernameString).get
    }
    user
  }
}

case class AuthenticationResult(userExists: Boolean, authenticated: Boolean)
