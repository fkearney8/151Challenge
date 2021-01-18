package models

/**
 * TODO: Move passcodes into a database? 
 */
object Passcodes {

  def isValid(passcode: String) = {
    passcode == "Kearney"
  }

}
