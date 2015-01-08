package object models {

  import scala.slick.driver.PostgresDriver.simple._
  import play.api.db.DB
  import play.api.Logger
  import play.api.Play.current

  lazy val db = {
    Logger.debug(s"Configuring slick database: $DB")
    Database.forDataSource(DB.getDataSource())
  }

}
