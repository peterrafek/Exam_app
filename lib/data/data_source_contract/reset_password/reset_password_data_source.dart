import 'package:exam_app/domain/entities/reset_password/request/reset_password_request_entity.dart';

import '../../../core/result.dart';
import '../../../domain/entities/reset_password/response/reset_password_response_entity.dart';

abstract interface class ResetPasswordDataSource {
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request);
}
