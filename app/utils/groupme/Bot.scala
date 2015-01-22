package utils.groupme

import play.api.Logger
import play.api.Play.current
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json.{Json,JsValue}
import play.api.libs.ws.WS

class Bot(idc: Option[String], urlc: Option[String]) {

  def post(text: String) = {
    (idc, urlc) match {
      case (Some(id), Some(url)) =>
        val data: JsValue = Json.obj("bot_id" -> id, "text" -> text)
        WS.url(url).post(data).map {
          case response => {
            // Log if response.status is not 2xx?
          }
        }
      case _ =>
        Logger.warn("Not able to send message to GroupMe, GroupMe settings not defined. Would have sent: " + text)
    }

  }
}

