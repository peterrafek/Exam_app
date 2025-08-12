
import '../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';

sealed class ForgetPasswordIntent {}

class OnConfirmEmailForgetPasswordClickIntent extends ForgetPasswordIntent {
  ForgetPasswordRequestEntity request;

  OnConfirmEmailForgetPasswordClickIntent({required this.request});
}
