import '../../../domain/entities/reset_password/request/reset_password_request_entity.dart';

sealed class ResetPasswordIntent {}

class OnContinueButtonPressedIntent extends ResetPasswordIntent {
  ResetPasswordRequestEntity request;

  OnContinueButtonPressedIntent(this.request);
}
