import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/data/api/dto/forget_password/request/forget_password_request_dto.dart';
import 'package:exam_app/data/api/dto/forget_password/response/forget_password_response_dto.dart';
import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/forget_password/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../api/api_client.dart';
import '../../data_source_contract/forget_password/forget_password_data_source.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ApiClient apiClient;

  @factoryMethod
  ForgetPasswordDataSourceImpl(this.apiClient);

  @override
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) async {
    var res = await ApiExecutor.executeApi(() =>
        apiClient.forgetPassword(ForgetPasswordRequestDto.toDto(request)));
    switch (res) {
      case Success<ForgetPasswordResponseDto>():
        return Success(data: ForgetPasswordResponseDto.toEntity(res.data));
      case Error<ForgetPasswordResponseDto>():
        return Error(exception: res);
    }
  }
}
