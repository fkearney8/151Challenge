import play.api._
import models._
import utils.Scheduler
import utils.groupme.DailyDigestBot

object Global extends GlobalSettings {

  override def onStart(app: Application) {
    Logger.info("Application has started: Setting up database")

    new DailyDigestBot().postReport
    new Scheduler().start()
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
  }

}
