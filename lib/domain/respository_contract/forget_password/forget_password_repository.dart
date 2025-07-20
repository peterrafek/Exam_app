import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/forget_password/response/forget_password_response_entity.dart';

import '../../../core/result.dart';

abstract interface class ForgetPasswordRepository {
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);
}
