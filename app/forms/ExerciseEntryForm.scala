package forms

import java.util.{Calendar, Date}

import controllers.handlers.{PercentageCalculator, AggregateDataHelper, OneFiveOneConstants}
import models.{ExerciseEntries, ExerciseEntry}
import play.api.Logger
import play.api.data.Forms._
import play.api.data.format.Formatter
import play.api.data.{FormError, _}
import utils.Exercises._


case class ExerciseEntryFormInput(exerciseType: Exercise, reps:Double, when: Date, comment: String)

object ExerciseEntriesForm {
  val exerciseEntryForm = Form(
    mapping(
      "exerciseType" -> ExerciseCustomMappings.exerciseEntryMapping,
      "reps" -> ExerciseCustomMappings.doubleMapping, //Since miles "reps" may be doubles
      "when" -> date,
      "comment" -> text
    )(ExerciseEntryFormInput.apply)(ExerciseEntryFormInput.unapply)
  )

  def validateEntry(entry: ExerciseEntry): Option[String] = {
    val repsValidationString = entry match {
      case ExerciseEntry(_, Miles, _, _, _, _) => None
      case ExerciseEntry(_, Shot, _, _, userId, _) =>
        //is this user done with the other stuff?
        val userEntries = ExerciseEntries.getAllForUser(userId)
        val summedEntries = AggregateDataHelper.sumEntries(userEntries)
        val totalPercentageComplete = PercentageCalculator.calculateOverallPercentComplete(summedEntries)
        if (totalPercentageComplete + .0001 < 100.00) {
          Some("Can't do the shot when you haven't done everything else!")
        } else None
      case ExerciseEntry(_, _, reps, _, _, _) =>
        if (!reps.isValidInt) Some("Cannot have fractions unless you are entering miles.")
        else None
    }

    val dateValidationString = {

      val twoWeeksAgo = Calendar.getInstance()
      twoWeeksAgo.setTimeInMillis(System.currentTimeMillis() - (1000 * 60 * 60 * 24 * 14))
      if (entry.when.compareTo(twoWeeksAgo) < 0) {
        Some("Date cannot be more than 2 weeks in the past. Get with the program.")
      } else if (entry.when.compareTo(OneFiveOneConstants.START_OF_CHALLENGE) < 0) {
        Some("Date cannot be before the start of the challenge, cheater.")
      } else None
    }

    if (repsValidationString.isDefined || dateValidationString.isDefined) {
      Some(repsValidationString.fold("")(_ + " ") + dateValidationString.getOrElse(""))
    } else None
  }
}

//Note to Other devs - for some reason, you must put any custom formatter in some other class or object than where the form is defined.
// If you don't, the Formatter will be null when the Mapping is instantiated, even if passed explicitly.
// I have no idea why that would not work, but finally happened to try this after 3 hours and it suddenly works.
object ExerciseCustomMappings {
  implicit val exerciseTypeFormatter = new Formatter[Exercise] {
    override def bind(key: String, data: Map[String, String]): Either[Seq[FormError], Exercise] = {
      Left(List(new FormError(key, "Exercise type Mapping not complete")))

      val mappedValue = data.get(key).map { value =>
        try {
          Right(Exercise.withName(value))
        } catch {
          case e: NoSuchElementException => Left(List(new FormError(key, value + " is not a valid exercise type")))
        }
      }
      mappedValue.getOrElse(Left(List(new FormError(key, "No exercise type provided"))))
    }


    override def unbind(key: String, value: Exercise): Map[String, String] = {
      Map(key -> value.toString)
    }
  }

  def exerciseEntryMapping: Mapping[Exercise] = Forms.of[Exercise]

  //There's a doubleFormat provided in the Play framework, but not a mapping for it in play.api.data.Forms. Weird.
  def doubleMapping: Mapping[Double] = Forms.of[Double](play.api.data.format.Formats.doubleFormat)
}

