package models

import java.sql.{Date => SqlDate}
import java.util.Calendar

import controllers.handlers.OneFiveOneDateUtils
import utils.ChallengeYears
import utils.ChallengeYears._
import utils.Exercises.Exercise

import scala.slick.driver.PostgresDriver.simple._
import scala.slick.lifted.ProvenShape

case class ExerciseEntry(id: Int, exerciseType: Exercise, reps: Double, when: Calendar, userId: Int, comment: String) {

  def toRow: ExerciseEntries.RowType = (id, exerciseType.toString, reps, new SqlDate(when.getTimeInMillis), userId, comment)

  def this(row: ExerciseEntries.RowType) {
    this(row._1, Exercise.withName(row._2), row._3, {
          val entryCal = Calendar.getInstance()
          entryCal.setTimeInMillis(row._4.getTime)
          //dates stored in the DB are at midnight in the local timezone (UTC on the deployed host)
          // These would become a day earlier compared to epoch in PST
          // The dates we compare against are at noon. This happens because we round off the hours.
          OneFiveOneDateUtils.roundToDay(entryCal)
          entryCal
        },
      row._5, row._6)
  }
}

class ExerciseEntries(tag: Tag, tableName: String = "EXERCISE_ENTRIES_2015") extends Table[ExerciseEntries.RowType](tag, tableName) {
  def id           = column[Int]("id", O.AutoInc, O.PrimaryKey)
  def exerciseType = column[String]("exercisetype")
  def reps         = column[Double]("reps")
  def dateDone     = column[SqlDate]("datedone")
  def userId       = column[Int]("userid")
  def comment      = column[String]("comment")

  def user = foreignKey("EXERCISE_ENTRIES_userid_fkey", userId, Users.users)(_.id)

  def * : ProvenShape[ExerciseEntries.RowType] = (id, exerciseType, reps, dateDone, userId, comment)
}

object ExerciseEntries {
  import ChallengeYears.ChallengeYear
  type RowType = (Int, String, Double, SqlDate, Int, String)


  def exerciseEntries(year: ChallengeYear = ThisYear) =
    TableQuery[ExerciseEntries]((tag: Tag) => new ExerciseEntries(tag, year.entriesTable))

  def add(exEntry: ExerciseEntry): Unit = {
    db.withSession { implicit session =>
      exerciseEntries() += exEntry.toRow
    }
  }

  def getAllForUser(userId: Int, year: ChallengeYear = ThisYear): List[ExerciseEntry] = {
    db.withSession { implicit session =>
      exerciseEntries(year).filter{_.userId === userId}.list.map{new ExerciseEntry(_)}
    }
  }

  def getAll(year: ChallengeYear = ThisYear): List[ExerciseEntry] = {
    db.withSession { implicit session =>
      exerciseEntries(year).list.map{new ExerciseEntry(_)}
    }
  }

  def get(id: Int, year: ChallengeYear = ThisYear): ExerciseEntry = {
    db.withSession { implicit session =>
      val rowData = exerciseEntries(year).filter(_.id === id).list.head
      new ExerciseEntry(rowData)
    }
  }

}