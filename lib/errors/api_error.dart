class ApiError {
  final String message;
  const ApiError(this.message);

  factory ApiError.internet() =>
      const ApiError('Check your internet connection');
  factory ApiError.timeOut() =>
      const ApiError('Timeout has been reached. Please try again later');
  factory ApiError.invalidDetails() =>
      const ApiError('Login failed. Invalid Details');
  factory ApiError.fromResponse(String error) => ApiError(error);
  factory ApiError.unKnown() => const ApiError('An unknown error occurred');
}
