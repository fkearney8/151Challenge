package models

import java.util.{Date => UtilDate}
import java.sql.{Date => SqlDate}

import play.api.Logger

import scala.slick.driver.PostgresDriver.simple._
import scala.slick.lifted.ProvenShape


case class ExerciseEntry(id: Int, exerciseType: ExerciseType.Value, reps: Double, when: UtilDate, userId: Int, comment: String) {
  def toRow: ExerciseEntries.RowType = (id, exerciseType.toString, reps, new SqlDate(when.getTime), userId, comment)
  def this(row: ExerciseEntries.RowType) {
    this(row._1, ExerciseType.withName(row._2), row._3, new UtilDate(row._4.getTime), row._5, row._6)
  }
}

object ExerciseType extends Enumeration {
  val SitUps, Lunges, Burpees, Miles, Shot = Value
}

class ExerciseEntries(tag: Tag) extends Table[ExerciseEntries.RowType](tag, "EXERCISE_ENTRIES") {
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
  type RowType = (Int, String, Double, SqlDate, Int, String)

  val exerciseEntries = TableQuery[ExerciseEntries]

  def add(exEntry: ExerciseEntry): Unit = {
    db.withSession { implicit session =>
      exerciseEntries += exEntry.toRow
    }
  }

  def getAllForUser(userId: Int): List[ExerciseEntry]= {
    db.withSession { implicit session =>
      exerciseEntries.filter{_.userId === userId}.list.map{new ExerciseEntry(_)}
    }
  }
}