package forms

import play.api.data._
import play.api.data.Forms._

object RegistrationForm {

  case class FormData(
    email: String,
    username: String,
    password1: String,
    password2: String,
    passcode: String)

  val form = Form(
    mapping(
      "email"     -> nonEmptyText,
      "username"  -> nonEmptyText,
      "password1" -> nonEmptyText,
      "password2" -> nonEmptyText,
      "passcode"  -> nonEmptyText
    )(FormData.apply)(FormData.unapply)
  )

}
