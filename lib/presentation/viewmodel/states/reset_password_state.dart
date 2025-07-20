sealed class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  Object exception;

  ResetPasswordErrorState({required this.exception});
}
