import play.api._

object Global extends GlobalSettings {

  override def onStart(app: Application) {
    Logger.info("Application has started: Setting up database")
    models.Users.createTable
    models.Users.addFakeUser
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
  }

}
