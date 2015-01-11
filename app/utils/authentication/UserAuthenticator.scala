package utils.authentication

import models.Users
import play.api.libs.Crypto
import play.api.mvc.RequestHeader

object UserAuthenticator {

  val USERNAME_SESSION_KEY: String = "username"

  def authenticateUser(username: String, password: String): AuthenticationResult = {
    //hash the password with the applications secret, algorithm is the insecure sha1 built in to Play, but eh... we're not protecting the crown jewels here
    val passwordSig = Crypto.sign(password)

    //retrieve the user and check the password signature from the database
    val userOption = Users.findByEmailOrUsername("", username)
    userOption match {
      case Some(user) =>
        AuthenticationResult(true, user.password == passwordSig)
      case None => AuthenticationResult(false, false)
    }
  }

  def getAuthenticatedUser(request: RequestHeader): Option[String] = {
    request.session.get(USERNAME_SESSION_KEY)
  }
}

case class AuthenticationResult(userExists: Boolean, authenticated: Boolean)
