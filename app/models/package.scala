package object models {

  import scala.slick.driver.H2Driver.simple._

  lazy val db = Database.forURL("jdbc:h2:mem:play;MODE=PostgreSQL", driver = "org.h2.Driver")

}
