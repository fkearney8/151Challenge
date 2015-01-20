package utils.groupme

import play.api.Logger
import play.api.Play.current
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json.{Json,JsValue}
import play.api.libs.ws.WS

class Bot(idc: String, urlc: String) {
  var id: String = idc
  var url: String = urlc

  def post(text: String) = {
    val data: JsValue = Json.obj("bot_id" -> id, "text" -> text)
    WS.url(url).post(data).map {
      case response => {
        // Log if response.status is not 2xx?
      }
    }
  }
}
