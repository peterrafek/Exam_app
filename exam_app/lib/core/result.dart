sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success({required this.data});
}

class Error<T> extends Result<T> {
  String? errorMessage;
  Exception? exception;

  Error({
    this.exception,
    this.errorMessage,
  });
}
