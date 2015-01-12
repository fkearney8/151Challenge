package controllers

import play.api._
import play.api.mvc._
import play.api.mvc.Security.AuthenticatedBuilder

import utils.authentication._

class BaseController extends Controller {

  val LOGIN_REFERRER: String = "loginReferrer"
  
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
