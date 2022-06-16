class ErrorHandle implements Exception {
  ErrorHandle(this.errorHanleType);
  final ErrorHandleType errorHanleType;
}

enum ErrorHandleType { API, NETWORK }
