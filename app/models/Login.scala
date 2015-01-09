package models

import play.api.data._
import play.api.data.Forms._

object Login {

  val USERNAME_FIELD = "username"
  val PASSWORD_FIELD = "password"

  val loginForm = Form(
    tuple(
      "username" -> text,
      "password" -> text
    )
  )

}
