package controllers.handlers

import java.util.Calendar

import controllers.Application._
import forms.{ExerciseEntriesForm, ExerciseEntryFormInput}
import models.{ExerciseEntries, ExerciseEntry, Users}
import play.api.data.{Form, FormError}
import play.api.mvc.{AnyContent, Request, Result}
import utils.authentication.UserAuthenticator
import utils.groupme.Bot

object AddExerciseHandler {
  lazy val bot = new Bot(sys.env("GROUPME_BOT_ID"), sys.env("GROUPME_URL"))

  def addExerciseEntry(implicit request: Request[AnyContent]): Result = {
    val formInfo: Form[ExerciseEntryFormInput] = ExerciseEntriesForm.exerciseEntryForm.bindFromRequest()
    if (formInfo.errors.nonEmpty) {
      BadRequest {
        val formErrorString = formInfo.errors.foldLeft("")((aggregateString: String, eachError: FormError) => {
          aggregateString + " " + eachError.message
        })
        "There were problems with your submission: " + formErrorString
      }
    } else {
      val formData = formInfo.get
      UserAuthenticator.getAuthenticatedUser(request).fold(BadRequest("No authenticated user when adding exercise")){
        authUser => {
          //ID is 0 here because it does not have an affect on insertion
          //TODO try an implicit conversion for all these?
          val entryCal = {
            val cal = Calendar.getInstance
            cal.setTimeInMillis(formData.when.getTime)
            cal
          }
          val exerciseEntry = ExerciseEntry(0, formData.exerciseType, formData.reps, entryCal, authUser.id, formData.comment)
          val errorString = ExerciseEntriesForm.validateEntry(exerciseEntry)
          errorString.fold {
            ExerciseEntries.add(exerciseEntry)
            notify(exerciseEntry)
            Redirect("/displayEntries")
          }(BadRequest(_))
        }
      }
    }
  }

  def notify(exercise: ExerciseEntry) {
    val user = Users.findById(exercise.userId)
    user match {
      case Some(user) => {
        val username = user.username
        val reps = exercise.reps
        val exerciseType = exercise.exerciseType
        bot.post(s"$username recorded $reps $exerciseType")
      }
      case None => {}
    }
  }

}
