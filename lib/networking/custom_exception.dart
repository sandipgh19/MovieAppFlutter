class CustomException implements Exception {
  final _message;
  final _prefix;
  final _resultType;

  CustomException([this._message, this._prefix, this._resultType]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message, resultType]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message, resultType]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message, resultType]) : super(message, "Invalid Input: ");
}