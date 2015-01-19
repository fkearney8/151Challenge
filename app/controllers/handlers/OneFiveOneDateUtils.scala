package controllers.handlers

import java.text.SimpleDateFormat
import java.util.{TimeZone, Calendar}

import models.ExerciseEntry

object OneFiveOneDateUtils {

  def roundToDay(calendar: Calendar): Calendar = {
    calendar.set(Calendar.HOUR_OF_DAY, 0)
    calendar.set(Calendar.MINUTE, 0)
    calendar.set(Calendar.SECOND, 0)
    calendar.set(Calendar.MILLISECOND, 0)
    calendar
  }

  //could make implicit
  def printableDate(calendar: Calendar): String = {
    new SimpleDateFormat("MM/dd/yyyy").format(calendar.getTime)
  }

  def nextDay(currentDay: Calendar): Calendar = {
    val nextDay: Calendar = Calendar.getInstance()
    nextDay.setTimeInMillis(currentDay.getTimeInMillis + 24 * 60 * 60 * 1000)
    nextDay
  }

  def getYesterday: Calendar = {
    //calculate yesterday based on PST, so that our west coasters see yesterday making sense after 4pm when UTC flips over.
    val yesterdayPT = getToday
    roundToDay(yesterdayPT)
    yesterdayPT.roll(Calendar.DAY_OF_YEAR, -1)

    //create a 'yesterday' in the default TZ, (which will be UTC on the production host, but this will work regardless of what it is)
    // and set the year, month, and day for the pacific time's yesterday onto it. We have to do this because we want to be
    // looking for exercises that are marked as entered at 12:00am on yesterday in the default time zone of the remote host, but we
    // want to think of yesterday as the day before today in pacific time.
    val yesterdayDefaultTZ = Calendar.getInstance()
    yesterdayDefaultTZ.set(Calendar.YEAR, yesterdayPT.get(Calendar.YEAR))
    yesterdayDefaultTZ.set(Calendar.MONTH, yesterdayPT.get(Calendar.MONTH))
    yesterdayDefaultTZ.set(Calendar.DAY_OF_YEAR, yesterdayPT.get(Calendar.DAY_OF_YEAR))
    roundToDay(yesterdayDefaultTZ)

    yesterdayDefaultTZ
  }

  def getToday: Calendar = {
    Calendar.getInstance(TimeZone.getTimeZone("America/Los_Angeles"))
  }

  def wasEntryOnDay(eachEntry: ExerciseEntry, dayInQuestion: Calendar): Boolean = {
    val entryDay = eachEntry.when
    isGivenTimeWithinDay(entryDay, dayInQuestion)
  }

  def isGivenTimeWithinDay(givenTime: Calendar, dayInQuestion: Calendar): Boolean = {
    (givenTime.compareTo(dayInQuestion) >= 0) && givenTime.before(nextDay(dayInQuestion))
  }

  def fromStartToToday(): Seq[Calendar] = {
    val start = OneFiveOneConstants.START_OF_CHALLENGE
    var currentDay = start
    val today = roundToDay(Calendar.getInstance())

    var output = List.empty[Calendar]
    //TODO make this a nice recursive without the vars
    while (currentDay.compareTo(today) <= 0) {
      output = output :+ currentDay
      currentDay = nextDay(currentDay)
    }

    output
  }

}
