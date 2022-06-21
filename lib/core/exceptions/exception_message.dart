class ExceptionMessage implements Exception {
  ExceptionMessage(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
