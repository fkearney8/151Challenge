package object models {

  import scala.slick.driver.PostgresDriver.simple._
  import play.api.db.DB
  import play.api.Logger
  import play.api.Play.current

  // TODO: I think we should cache the Database object on app startup
  //       and destroy it when the app shuts down, instead of using
  //       a global connection object.
  //       If you make this a lazy val it doesn't actually get shutdown
  //       right when running tests.
  val db = {
    Logger.debug(s"Configuring slick database: $DB")
    Database.forDataSource(DB.getDataSource())
  }

}
