package models

import org.h2.jdbc.JdbcSQLException

import scala.slick.driver.H2Driver.simple._
import scala.slick.lifted.ProvenShape

class Users(tag: Tag) extends Table[(String, String)](tag, "USERS") {

  def username = column[String]("USERNAME")
  def password = column[String]("PASSWORD")

  def * : ProvenShape[(String, String)] = (username, password)
}

object Users {

  //TODO this has to happen on startup if the table doesn't exist.
  def createTable(): Unit = {

    val users = TableQuery[Users]
    db.withSession { implicit session =>
      try {
        users.ddl.create
      } catch {
        case jdbce: JdbcSQLException => System.out.println("Swallowed table already exists exception")
      }
    }
  }

  def addUser(username: String, password: String) {
    val users = TableQuery[Users]
    db.withSession { implicit session =>
      users += (username, password)
    }
  }

  def addFakeUser() {
    addUser("FrankTest", System.currentTimeMillis().toString)
  }

  def getUsers: List[(String, String)] = {
    val users = TableQuery[Users]
    db.withSession { implicit session =>
      users.list
    }
  }
}




