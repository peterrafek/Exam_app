import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';

import '../../../core/result.dart';

abstract interface class LogInDataSource {
  Future<Result<LoginResponseEntity>> logIn(LoginRequestEntity request);
}
