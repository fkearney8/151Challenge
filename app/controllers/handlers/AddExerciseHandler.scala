package controllers.handlers

import java.util.Calendar

import controllers.Application._
import forms.{ExerciseEntriesForm, ExerciseEntryFormInput}
import models.{ExerciseEntries, ExerciseEntry, Users}
import play.api.Logger
import play.api.data.{Form, FormError}
import play.api.mvc.{AnyContent, Request, Result}
import utils.authentication.UserAuthenticator
import utils.groupme.Bot

object AddExerciseHandler {
  //TODO this could make nice use of a dependency injection framework for use in tests... say just log it to the console if we get the test bot
  lazy val bot = new Bot(sys.env.get("GROUPME_BOT_ID"), sys.env.get("GROUPME_URL"))

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
            Redirect("/record?justRecorded=true")
          }(BadRequest(_))
        }
      }
    }
  }

  def notify(exercise: ExerciseEntry) {
    val user = Users.findById(exercise.userId)
    user match {
      case Some(userActual) =>
        val username = userActual.username
        val reps = exercise.reps
        val exerciseType = exercise.exerciseType
        Logger.debug(s"Not sending to bot right now: $username recorded $reps $exerciseType\n${exercise.comment}")
//        bot.post(s"$username recorded $reps $exerciseType\n${exercise.comment}")
      case None => Logger.error(s"No user for exercise entered: $exercise")
    }
  }

}
