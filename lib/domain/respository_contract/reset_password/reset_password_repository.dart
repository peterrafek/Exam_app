import 'package:exam_app/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response_entity.dart';

import '../../../core/result.dart';

abstract interface class ResetPasswordRepository {
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request);
}
