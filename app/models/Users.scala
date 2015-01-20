package models

import play.api.Logger
import play.api.libs.Crypto

import scala.slick.driver.PostgresDriver.simple._
import scala.slick.lifted.ProvenShape

import java.sql.SQLException

case class User(id: Int, email: String, username: String, password: String, admin: Int = 0) {
  def toRow: Users.RowType = (id, email, username, password, admin)
}

object User {

  def apply(row: Users.RowType): User = User(row._1, row._2, row._3, row._4, row._5)

  /**
   * Hash the password with the applications secret.
   * The algorithm is the insecure sha1 built in to Play,
   * but eh... we're not protecting the crown jewels here
   */
  def passwordHash(password: String) = Crypto.sign(password)

}

class Users(tag: Tag) extends Table[Users.RowType](tag, "USERS") {
  def id       = column[Int]("id", O.AutoInc, O.PrimaryKey)
  def email    = column[String]("email")
  def username = column[String]("username")
  def password = column[String]("password")
  def admin    = column[Int]("admin")
  def * : ProvenShape[Users.RowType] = (id, email, username, password, admin)
}

object Users {

  type RowType = (Int, String, String, String, Int)

  val users = TableQuery[Users]

  /**
   * May be used to validate/detect an email address.
   * TODO: Find a better regex.  
   */
  private val EMAIL_REGEX = ".+@.+".r

  def add(user: User) {
    db.withSession { implicit session =>
      users += user.toRow
    }
  }

  def findByEmailOrUsername(email: String, username: String): Option[User] = {
    findSingleUser { user => user.email === email || user.username === username }
  }

  def findByEmail(email: String): Option[User] = {
    findSingleUser { user => user.email === email }
  }

  def findById(id: Int): Option[User] = {
    findSingleUser { user => user.id === id }
  }

  def findByUsername(username: String): Option[User] = {
    findSingleUser { user => user.username === username }
  }

  /**
   * Detects the type of identifier for the user and looks up the user. 
   */
  def findByLoginIdentifier(emailOrUsername: String): Option[User] = emailOrUsername match {
    case EMAIL_REGEX() => findByEmail(emailOrUsername)
    case _           => findByUsername(emailOrUsername) 
  }

  def findAll: List[User] = {
    db.withSession { implicit session =>
      users.list.map { row => User(row) }
    }
  }

  private def findSingleUser(userFilter: Users => Column[Boolean]): Option[User] = {
    db.withSession { implicit session =>
      users
        .filter(userFilter)
        .take(1)
        .list
        .headOption
        .map { row => User(row) }
    }
  }
}
