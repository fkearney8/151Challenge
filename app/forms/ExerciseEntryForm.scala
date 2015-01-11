package forms

import java.util.{Calendar, Date}

import models.{ExerciseType, ExerciseEntry}
import play.api.data.Forms._
import play.api.data.format.Formatter
import play.api.data.{FormError, _}


object ExerciseEntriesForm {
  val exerciseEntryForm = Form(
    mapping(
      "exerciseType" -> ExerciseCustomMappings.exerciseEntryMapping,
      "reps" -> ExerciseCustomMappings.doubleMapping, //Since miles "reps" may be doubles
      "when" -> date,
      "comment" -> text
    )(ExerciseEntry.apply)(ExerciseEntry.unapply)
  )

  def validateEntry(entry: ExerciseEntry): Option[String] = {
    val repsValidationString = entry match {
      case ExerciseEntry(ExerciseType.Miles, _, _, _) => None
      case ExerciseEntry(_, reps, _, _) =>
        if (!reps.isValidInt) Some("Cannot have fractions unless you are entering miles.")
        else None
    }
    val dateValidationString = {
      val whenEntryDone = Calendar.getInstance
      whenEntryDone.setTime(entry.when)
      val twoWeeksAgo = Calendar.getInstance()
      twoWeeksAgo.setTimeInMillis(System.currentTimeMillis() - (1000 * 60 * 60 * 24 * 14))
      val startOfChallenge = Calendar.getInstance()
      startOfChallenge.set(Calendar.YEAR, 2015)
      startOfChallenge.set(Calendar.MONTH, Calendar.JANUARY)
      startOfChallenge.set(Calendar.DAY_OF_MONTH, 12)

      if (whenEntryDone.compareTo(twoWeeksAgo) < 0) {
        Some("Date cannot be more than 2 weeks in the past. Get with the program.")
      } else if (whenEntryDone.compareTo(startOfChallenge) < 0) {
        Some("Date cannot be before the start of the challenge, cheater.")
      } else None
    }

    if (repsValidationString.isDefined || dateValidationString.isDefined) {
      Some(repsValidationString.getOrElse("") + dateValidationString.getOrElse(""))
    } else None
  }
}

//Note to Other devs - for some reason, you must put any customer formatter in some other class or object than where the form is defined.
// If you don't, the Formatter will be null when the Mapping is instantiated, even if passed explicitly.
// I have no idea why this is broken, but finally happened to try this after 3 hours with no other changes and it suddenly works.
object ExerciseCustomMappings {
  implicit val exerciseTypeFormatter = new Formatter[ExerciseType.Value] {
    override def bind(key: String, data: Map[String, String]): Either[Seq[FormError], ExerciseType.Value] = {
      Left(List(new FormError(key, "Exercise type Mapping not complete")))
            val mappedValue = data.get(key).map { value =>
              try {
                Right(ExerciseType.withName(value))
              } catch {
                case e: NoSuchElementException => Left(List(new FormError(key, value + " is not a valid exercise type")))
              }
            }
            mappedValue.getOrElse(Left(List(new FormError(key, "No exercise type provided"))))
    }


    override def unbind(key: String, value: ExerciseType.Value): Map[String, String] = {
      Map(key -> value.toString)
    }
  }

  def exerciseEntryMapping: Mapping[ExerciseType.Value] = Forms.of[ExerciseType.Value]

  //There's a doubleFormat provided in the Play framework, but not a mapping for it in play.api.data.Forms. Weird.
  def doubleMapping: Mapping[Double] = Forms.of[Double](play.api.data.format.Formats.doubleFormat)
}

