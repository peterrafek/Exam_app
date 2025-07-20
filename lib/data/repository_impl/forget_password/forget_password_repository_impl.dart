import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/forget_password/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/respository_contract/forget_password/forget_password_repository.dart';
import '../../data_source_contract/forget_password/forget_password_data_source.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordDataSource forgetPasswordDataSource;

  @factoryMethod
  ForgetPasswordRepositoryImpl(this.forgetPasswordDataSource);

  @override
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) {
    return forgetPasswordDataSource.forgetPassword(request);
  }
}
