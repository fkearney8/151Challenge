import play.api._
import models._

object Global extends GlobalSettings {

  override def onStart(app: Application) {
    //todo start up a thread to use the GroupMe bot to report once a night about the best 151ers from the previous 24 hours
    Logger.info("Application has started: Setting up database")
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
  }

}
