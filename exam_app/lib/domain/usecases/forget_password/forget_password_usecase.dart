import 'package:exam_app/domain/respository_contract/forget_password/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../entities/forget_password/response/forget_password/forget_password_response.dart';

@injectable
class GetForgetPasswordUsecase {
  ForgetPasswordRepository _forgetPasswordRepository;

  GetForgetPasswordUsecase(this._forgetPasswordRepository);

  Future<Result<ForgetPasswordResponseEntity>> execute(
      ForgetPasswordRequestEntity request) {
    return _forgetPasswordRepository.forgetPassword(request);
  }
}
