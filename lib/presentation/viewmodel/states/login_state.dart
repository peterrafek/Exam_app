sealed class LoginState {}

class LoginStateInitialState extends LoginState {}

class LoginStateLoadingState extends LoginState {}

class LoginStateSuccessState extends LoginState {}

class LoginStateErrorState extends LoginState {
  Object exception;

  LoginStateErrorState({required this.exception});
}
