package controllers.handlers

import java.text.SimpleDateFormat
import java.util.Calendar

object OneFiveOneUtils {
  //could make implicit
  def printableDate(calendar: Calendar): String = {
    new SimpleDateFormat("MM/dd/yyyy").format(calendar.getTime)
  }

  def roundToDay(calendar: Calendar): Calendar = {
    calendar.set(Calendar.HOUR_OF_DAY, 0)
    calendar.set(Calendar.MINUTE, 0)
    calendar.set(Calendar.SECOND, 0)
    calendar.set(Calendar.MILLISECOND, 0)
    calendar
  }
}
