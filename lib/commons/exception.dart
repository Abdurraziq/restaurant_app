class ErrorException implements Exception {
  final String message;

  const ErrorException(this.message);
}

class FetchDataErrorException extends ErrorException {
  const FetchDataErrorException([String? message])
      : super(message ?? 'Error has occurred while fetch data');
}

class EmptyDataException extends ErrorException {
  const EmptyDataException([String? message])
      : super(message ?? 'No data found');
}
