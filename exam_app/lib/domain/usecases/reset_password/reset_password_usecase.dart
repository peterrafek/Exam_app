import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../respository_contract/reset_password/reset_password_repository.dart';

@injectable
class GetResetPasswordUsecase {
  ResetPasswordRepository resetPasswordRepository;

  @factoryMethod
  GetResetPasswordUsecase(this.resetPasswordRepository);

  Future<Result<ResetPasswordResponseEntity>> execute(ResetPasswordRequestEntity request) {
    return resetPasswordRepository.resetPassword(request);
  }
}
