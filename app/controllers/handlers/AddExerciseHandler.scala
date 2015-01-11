package controllers.handlers

import controllers.Application._
import forms.ExerciseEntriesForm
import models.ExerciseEntry
import play.api.data.{FormError, Form}
import play.api.mvc.{Request, AnyContent, Result}

object AddExerciseHandler {
  def addExerciseEntry(implicit request: Request[AnyContent]): Result = {
    val formInfo: Form[ExerciseEntry] = ExerciseEntriesForm.exerciseEntryForm.bindFromRequest()
    if (formInfo.errors.nonEmpty) {
      BadRequest {
        val formErrorString = formInfo.errors.foldLeft("")((aggregateString: String, eachError: FormError) => {
          aggregateString + " " + eachError.message
        })
        "There were problems with your submission: " + formErrorString
      }
    } else {
      val formData = formInfo.get
      val errorString = ExerciseEntriesForm.validateEntry(formData)
      errorString.fold(addValidatedExerciseEntry(formData))(BadRequest(_))
      Ok("Added exercise")
    }
  }

  private def addValidatedExerciseEntry(entry: ExerciseEntry) {

  }
}
