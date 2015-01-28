package controllers.handlers

class BadRequestException(message: String, cause: Throwable) extends Exception(message, cause) {

}
