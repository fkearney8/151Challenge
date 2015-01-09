import play.api._
import models._

object Global extends GlobalSettings {

  override def onStart(app: Application) {
    Logger.info("Application has started: Setting up database")

    // Setup a single test user.
    val fakeUser = User(0, "fraker@gmail.com", "fraker", "react")
    Users.findByEmailOrUsername(fakeUser.email, fakeUser.username) match {
      case Some(_) => {
        Logger.info("Fake user already exists.")
      }
      case None => {
        Logger.info("Adding fakeUser.")
        Users.add(fakeUser)
      }
    }
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
  }

}
