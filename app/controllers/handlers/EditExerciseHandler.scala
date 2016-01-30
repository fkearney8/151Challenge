package controllers.handlers

import models.ExerciseEntries
import play.api.mvc.{Result, AnyContent, Request, Results}
import play.api.mvc.Results._
import utils.authentication.UserAuthenticator

class EditExerciseHandler {

  def editExerciseEntry(implicit request: Request[AnyContent]): Result = {
    //look up the entry to make sure the logged-in user is the owner of the entry
    val entryIdOption = request.getQueryString("id")
    if (entryIdOption.isEmpty) {
      BadRequest("No entry id specified.")
    }
    val entryId = entryIdOption.get
    val exerciseEntry = ExerciseEntries.get(Integer.parseInt(entryId))

    val loggedInUser = UserAuthenticator.getAuthenticatedUser(request)
    if (loggedInUser.isEmpty) {
      BadRequest("No logged in user when trying to edit an entry.")
    }

    val user = loggedInUser.get
    if (user.id != exerciseEntry.userId) {
      BadRequest("Logged in user does not own the exercise entry they are trying to edit.")
    }

    Ok(views.html.editEntry(exerciseEntry))
  }

  def commitExerciseEntryChanges(implicit request: Request[AnyContent]): Result = {
    Ok("I didn't really edit anything!")
  }

}
