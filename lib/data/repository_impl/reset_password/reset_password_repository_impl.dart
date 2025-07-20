 import 'package:exam_app/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/entities/reset_password/request/reset_password_request_entity.dart';
import '../../../domain/respository_contract/reset_password/reset_password_repository.dart';
import '../../data_source_contract/reset_password/reset_password_data_source.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordDataSource resetPasswordDataSource;

  @factoryMethod
  ResetPasswordRepositoryImpl(this.resetPasswordDataSource);

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request) {
    return resetPasswordDataSource.resetPassword(request);
  }
}
