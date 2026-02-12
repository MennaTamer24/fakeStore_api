class ApiError {
  final String message;
  final String? status;

  ApiError({required this.message, this.status});

  String stringMessage() {
    return message;
  }
}
