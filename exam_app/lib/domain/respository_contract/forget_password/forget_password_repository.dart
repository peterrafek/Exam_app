
import '../../../core/result.dart';
import '../../entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../entities/forget_password/response/forget_password/forget_password_response.dart';

abstract interface class ForgetPasswordRepository {
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);
}
