

sealed class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

final class SignUpSuccess<T> extends SignUpStates {
  final T? data;

  SignUpSuccess({this.data});
}

final class SignUpFailure extends SignUpStates {
  final Exception? exception;
  final String? message;

  SignUpFailure({required this.exception, required this.message});
}
