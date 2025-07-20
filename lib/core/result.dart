sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success({required this.data});
}

class Error<T> extends Result<T> {
  Object exception;

  Error({required this.exception});
}
