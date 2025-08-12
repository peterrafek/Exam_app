import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/data/api/data_source_contract/forget_password/forget_password_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result.dart';
import '../../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../../../domain/entities/forget_password/response/forget_password/forget_password_response.dart';
import '../../api_client.dart';
import '../../dto/forget_password/requests/forget_password_request_dto.dart';
import '../../dto/forget_password/responses/forget_password_response_dto.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ApiClient _apiClient;

  @factoryMethod
  ForgetPasswordDataSourceImpl(this._apiClient);

  @override
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) async {
    var res = await ApiExecutor.executeApi(
      () => _apiClient.forgetPassword(ForgetPasswordRequestDto.toDto(request)),
    );
    switch (res) {
      case Success<ForgetPasswordResponseDto>():
        return Success(data: ForgetPasswordResponseDto.toEntity(res.data));
      case Error<ForgetPasswordResponseDto>(:final exception):
        return Error(exception: res.exception);
    }
  }
}
