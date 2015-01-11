import play.api._
import models._

object Global extends GlobalSettings {

  override def onStart(app: Application) {
    Logger.info("Application has started: Setting up database")

    // Setup a single test user.
    val fakeUser = User(0, "fkearney8@gmail.com", "fraker", "1fa867699ac4b81fd4071845f539011229daf0eb")
    val fakeUser2 = User(1, "castillo.bryan@gmail.com", "bcastill", "0793ce3d5d8d05030cdee34de329bc99bc75e035")

    addUserIfNotExists(fakeUser)
    addUserIfNotExists(fakeUser2)
  }

  def addUserIfNotExists(fakeUser: User) {
    Users.findByEmailOrUsername(fakeUser.email, fakeUser.username) match {
      case Some(_) =>
        Logger.info("Fake user " + fakeUser.username + "/" + fakeUser.email + " already exists.")
      case None =>
        Logger.info("Adding fakeUser.")
        Users.add(fakeUser)
    }
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
  }

}
