package controllers

import play.api._
import play.api.data._
import play.api.mvc._

import controllers.Application._
import forms.RegistrationForm
import models._
import utils.authentication._

object Registration extends BaseController {

  def displayRegistration = Action { implicit request =>
    Ok(views.html.registrationPage(RegistrationForm.form))
  }

  def registerUser = Action { implicit request =>
    RegistrationForm.form.bindFromRequest.fold(
      formWithErrors => {
        BadRequest(views.html.registrationPage(formWithErrors))
      },
      data => {
        if (data.password1 != data.password2) {
          BadRequest(withGlobalError(data, "Passwords do not match."))
        } else if (userExists(data)) {
          BadRequest(withGlobalError(data, "A user with that email or username already exists."))
        } else if (!isPasscodeValid(data)) {
          BadRequest(withGlobalError(data, "Invalid passcode."))
        } else {
          Logger.info(s"Creating user ${data.username} with email: '${data.email}'.")
          Users.add(User(0, data.email, data.username, User.passwordHash(data.password1), 0)) 
          Redirect("/").withSession(request.session +
            (UserAuthenticator.USERNAME_SESSION_KEY -> data.username))
          //Ok(views.html.registrationPage(RegistrationForm.form))
        }
      }
    )
  }

  private def isPasscodeValid(data: RegistrationForm.FormData) = {
    Passcodes.isValid(data.passcode)
  }

  private def userExists(data: RegistrationForm.FormData) = {
    Users.findByEmailOrUsername(data.email, data.username).isDefined
  }

  private def withGlobalError(data: RegistrationForm.FormData, message: String) = {
    views.html.registrationPage(
      RegistrationForm.form
        .fill(data)
        .withGlobalError(message))
  }

}
