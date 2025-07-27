import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';

sealed class LogInIntent {}

class OnLogInClickIntent extends LogInIntent {
  LoginRequestEntity request;

  OnLogInClickIntent({required this.request});
}

class OnRememberMeClickIntent extends LogInIntent {
  final LoginResponseEntity loginResponse;

  OnRememberMeClickIntent({required this.loginResponse});
}

class OnForgetPasswordClickIntent extends LogInIntent {}

class OnSignUpClickIntent extends LogInIntent {}
