package utils

object ChallengeYears {
  sealed abstract class ChallengeYear(val yearString: String, val entriesTable: String)

  case object Year2015 extends ChallengeYear("2015", "EXERCISE_ENTRIES_2015")
  case object Year2016 extends ChallengeYear("2016", "EXERCISE_ENTRIES_2016")
  case object Year2017 extends ChallengeYear("2017", "EXERCISE_ENTRIES_2017")
  case object ThisYear extends ChallengeYear("2021", "EXERCISE_ENTRIES_2021")
}




