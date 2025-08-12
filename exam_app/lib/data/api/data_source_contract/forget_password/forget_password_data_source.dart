
import '../../../../core/result.dart';
import '../../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../../../domain/entities/forget_password/response/forget_password/forget_password_response.dart';

abstract interface class ForgetPasswordDataSource {
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);
}
