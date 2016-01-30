package utils

import java.util.Calendar
import java.util.concurrent.{Executors, ScheduledExecutorService, TimeUnit}

import controllers.handlers.OneFiveOneDateUtils._
import play.api.Logger
import utils.groupme.DailyDigestBot

/**
  * Class responsible for setting up tasks to be run periodically.
  */
class Scheduler {

  val scheduledEs: ScheduledExecutorService = Executors.newScheduledThreadPool(1)
  val dailyDigest = new DailyDigestBot()

  /**
    * Start up the scheduled tasks.
    */
  def start() = {
    val digestDelayTime: Long = dailyDigestDelayTime()
    Logger.info(s"Starting digest bot in $digestDelayTime seconds.")
    scheduledEs.scheduleAtFixedRate(dailyDigestTask, digestDelayTime, 24 * 60 * 60, TimeUnit.SECONDS)
  }

  private def dailyDigestTask: Runnable = {
    new Runnable {
      override def run(): Unit = dailyDigest.postReport
    }
  }

  private def dailyDigestDelayTime(): Long = {
    val desiredStartHourPt = 7
    //7am PT is the desired start time
    val atStartTime = {
      val tomorrowAtStart = getNowPt
      //set to the time right at the hour
      tomorrowAtStart.set(Calendar.HOUR_OF_DAY, desiredStartHourPt)
      tomorrowAtStart.set(Calendar.MINUTE, 0)
      tomorrowAtStart.set(Calendar.SECOND, 0)
      tomorrowAtStart
    }

    //what time is it now in PT?
    val nowPt = getNowPt

    //if atStartTime has already passed today, roll forward a day
    if (atStartTime.compareTo(nowPt) < 0) {
      atStartTime.roll(Calendar.DAY_OF_YEAR, 1)
    }

    val diffMs = atStartTime.getTimeInMillis - nowPt.getTimeInMillis
    Logger.info(s"Pacific time milliseconds now: ${nowPt.getTimeInMillis}, desired start time ${atStartTime.getTimeInMillis}")
    //now should be before the desired start
    assert(diffMs > 0, s"Time now (${nowPt.getTimeInMillis}) should be before desired start time (${atStartTime.getTimeInMillis})")

    val diffSeconds = diffMs / 1000

    //but it could be that the calculation happened when 7am is still in the future of today (like it was done at 1am)
    // so if the difference is more than a day we want it modded by a day
    diffSeconds % (60 * 60 * 24)
  }
}
