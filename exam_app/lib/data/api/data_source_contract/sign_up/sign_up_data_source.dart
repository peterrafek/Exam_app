import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/domain/entities/sign_up/response/sign_up_response.dart';

abstract class SignUpDataSource {
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequestEntity request);
}
