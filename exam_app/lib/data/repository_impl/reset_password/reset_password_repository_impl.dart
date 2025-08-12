import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/respository_contract/reset_password/reset_password_repository.dart';
import '../../api/data_source_contract/reset_password/reset_password_data_source.dart';

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
