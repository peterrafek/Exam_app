
import 'package:exam_app/api/client/api_result.dart';

import '../../api/model/request/sign_up_request.dart';
import '../../api/model/response/sign_up_response.dart';

abstract class SignUpRepo{
  Future<Result<SignUpResponse>> signUp(SignUpRequest request);

}