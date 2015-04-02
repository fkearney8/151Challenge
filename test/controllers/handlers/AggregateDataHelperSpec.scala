package controllers.handlers

import java.util.Calendar

import models.ExerciseEntry
import org.junit.runner.RunWith
import org.specs2.mutable.Specification
import org.specs2.runner.JUnitRunner
import utils.Exercises

@RunWith(classOf[JUnitRunner])
class AggregateDataHelperSpec extends Specification {
  "AggregateDataHelper" should {
    "find the earliest shot taken date" in {
      val dayEarliestShotTaken: Calendar = calFromDaysAgo(5)
      val exerciseEntries = List(ExerciseEntry(1, Exercises.Shot, 1, calFromDaysAgo(0), 1, ""),
        ExerciseEntry(1, Exercises.Shot, 1, dayEarliestShotTaken, 1, ""),
        ExerciseEntry(1, Exercises.Shot, 1, calFromDaysAgo(1), 1, ""))
      val dateFound = AggregateDataHelper.dayEarliestShotTaken(exerciseEntries)
      println(s"Date Found ${OneFiveOneDateUtils.printableDate(dateFound.get)}")
      dateFound.get.get(Calendar.DAY_OF_YEAR) should be equalTo dayEarliestShotTaken.get(Calendar.DAY_OF_YEAR)
    }
  }

  private def calFromDaysAgo(daysAgo: Int): Calendar = {
    val cal = Calendar.getInstance()
    val currentDay = cal.get(Calendar.DAY_OF_YEAR)
    cal.set(Calendar.DAY_OF_YEAR, currentDay - daysAgo)
    cal
  }
}
