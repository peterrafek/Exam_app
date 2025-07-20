import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/forget_password/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../respository_contract/forget_password/forget_password_repository.dart';

@injectable
class GetForgetPasswordUsecase {
  ForgetPasswordRepository forgetPasswordRepository;

  @factoryMethod
  GetForgetPasswordUsecase(this.forgetPasswordRepository);

  Future<Result<ForgetPasswordResponseEntity>> execute(
      ForgetPasswordRequestEntity request) {
    return forgetPasswordRepository.forgetPassword(request);
  }
}
