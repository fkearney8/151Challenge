package utils.groupme

import play.api.Logger
import play.api.libs.json.{Json,JsValue}
import scalaj.http._

class Bot(idc: String, urlc: String) {
  var id: String = idc
  var url: String = urlc

  def post(text: String) = {
    val data: JsValue = Json.obj("bot_id" -> id, "text" -> text)
    val response = Http(url).postData(Json.stringify(data)).asString
    if (response.isError) {
      // Do stuff
    }
  }
}
