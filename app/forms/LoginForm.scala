package forms

import play.api.data.Forms._
import play.api.data._

object LoginForm {

  val USERNAME_FIELD = "username"
  val PASSWORD_FIELD = "password"

  val loginForm = Form(
    tuple(
      "username" -> text,
      "password" -> text
    )
  )

}
