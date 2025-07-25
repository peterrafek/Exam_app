import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/sign_up_request.dart';
import '../../api/model/response/sign_up_response.dart';
 @injectable
class SignUpUseCase{
   final SignUpRepo repo;
   SignUpUseCase(this.repo);

   Future<Result<SignUpResponse>> call(SignUpRequest request) {
     return  repo.signUp(request);
   }
}