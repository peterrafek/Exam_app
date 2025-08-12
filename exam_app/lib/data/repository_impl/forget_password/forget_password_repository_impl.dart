import 'package:exam_app/data/api/data_source_contract/forget_password/forget_password_data_source.dart';
import 'package:exam_app/domain/respository_contract/forget_password/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result.dart';
import '../../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../../../domain/entities/forget_password/response/forget_password/forget_password_response.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordDataSource _forgetPasswordDataSource;

  ForgetPasswordRepositoryImpl(this._forgetPasswordDataSource);

  @override
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) {
    return _forgetPasswordDataSource.forgetPassword(request);
  }
}
