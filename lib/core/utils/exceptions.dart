class BaseException implements Exception {
  BaseException(this._message, this._prefix, this._errorCode);

  final String _message;
  final dynamic _errorCode;
  final dynamic _prefix;

  @override
  String toString() {
    return "$_prefix$_message";
  }

  String errorCode() {
    return _errorCode;
  }

  String getMessage() {
    return _message;
  }
}

class FetchDataException extends BaseException {
  FetchDataException(String message, errorCode)
      : super(message, "Error During Communication: ", errorCode);
}

class BadRequestException extends BaseException {
  BadRequestException(String message, errorCode)
      : super(message, "Invalid Request: ", errorCode);
}

class NotFoundException extends BaseException {
  NotFoundException(String message, errorCode)
      : super(message, "Not found: ", errorCode);
}

class UnauthorizedException extends BaseException {
  UnauthorizedException(String message, errorCode)
      : super(message, "Unauthorized: ", errorCode);
}

class InvalidInputException extends BaseException {
  InvalidInputException(String message, errorCode)
      : super(message, "Invalid Input: ", errorCode);
}

class SystemException extends BaseException {
  SystemException(String message, errorCode)
      : super(message, "System exception: ", errorCode);
}
