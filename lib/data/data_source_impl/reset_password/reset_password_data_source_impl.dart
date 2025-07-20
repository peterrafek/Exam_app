import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/data/api/dto/reset_password/request/reset_password_request_dto.dart';
import 'package:exam_app/data/api/dto/reset_password/response/reset_password_response_dto.dart';
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../api/api_client.dart';
import '../../data_source_contract/reset_password/reset_password_data_source.dart';

@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSource {
  ApiClient apiClient;

  @factoryMethod
  ResetPasswordDataSourceImpl(this.apiClient);

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request) async {
    var res = await ApiExecutor.executeApi(
        () => apiClient.resetPassword(ResetPasswordRequestDto.toDto(request)));
    switch (res) {
      case Success<ResetPasswordResponseDto>():
        return Success(data: ResetPasswordResponseDto.toEntity(res.data));
      case Error<ResetPasswordResponseDto>():
        return Error(exception: res);
    }
  }
}
