package utils.groupme

import play.api.Logger
import play.api.Play.current
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json.{Json,JsValue}
import play.api.libs.ws.WS

class GroupMePoster(idc: Option[String], urlc: Option[String]) {

  def post(text: String) = {
    (idc, urlc) match {
      case (Some(id), Some(url)) =>
        val data: JsValue = Json.obj("bot_id" -> id, "text" -> text)
        WS.url(url).post(data).map {
          case response if response.status >= 300 || response.status < 200 =>
            Logger.error(s"Failed to post to GroupMe. Status ${response.status}\n\nResponse Body${response.body}")
        }
      case _ =>
        Logger.warn("Not able to send message to GroupMe, GroupMe settings not defined. Would have sent:\n" + text)
    }
  }
}

