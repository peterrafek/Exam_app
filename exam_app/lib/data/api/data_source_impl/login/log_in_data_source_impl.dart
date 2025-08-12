import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result.dart';
import '../../api_client.dart';
import '../../data_source_contract/login/log_in_data_source.dart';
import '../../dio_servies.dart';
import '../../dto/login/requests/login_request_dto.dart';
import '../../dto/login/responses/login_response_dto.dart';

@Injectable(as: LogInRemoteDataSource)
class LogInDataSourceImpl implements LogInRemoteDataSource {
  ApiClient _apiClient;

  @factoryMethod
  LogInDataSourceImpl(this._apiClient);

  @override
  Future<Result<LoginResponseEntity>> logIn(LoginRequestEntity request) async {
    var res = await ApiExecutor.executeApi(
      () => _apiClient.login(LoginRequestDto.toDto(request)),
    );
    switch (res) {
      case Success<LoginResponseDto>():
        DioServiceExtension.updateDioWithToken(res.data.token ?? '');
        return Success(data: LoginResponseDto.toEntity(res.data));
      case Error<LoginResponseDto>(:final exception):
        return Error(exception: res.exception);
    }
  }
}
