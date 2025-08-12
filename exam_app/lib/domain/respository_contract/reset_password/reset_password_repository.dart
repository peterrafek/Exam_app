
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response.dart';

import '../../../core/result.dart';

abstract interface class ResetPasswordRepository {
  Future<Result<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request);
}
