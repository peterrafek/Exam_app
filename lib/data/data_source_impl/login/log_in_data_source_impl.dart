import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../api/api_client.dart';
import '../../api/dio_servies.dart';
import '../../api/dto/login/requests/login_request_dto.dart';
import '../../api/dto/login/responses/login_response_dto.dart';
import '../../data_source_contract/login/log_in_data_source.dart';

@Injectable(as: LogInDataSource)
class LogInDataSourceImpl implements LogInDataSource {
  ApiClient apiClient;

  @factoryMethod
  LogInDataSourceImpl({required this.apiClient});

  @override
  Future<Result<LoginResponseEntity>> logIn(LoginRequestEntity request) async {
    var res = await ApiExecutor.executeApi(
      () => apiClient.login(LoginRequestDto.toDto(request)),
    );
    switch (res) {
      case Success<LoginResponseDto>():
        DioServiceExtension.updateDioWithToken(res.data.token ?? '');
        return Success(data: LoginResponseDto.toEntity(res.data));
      case Error<LoginResponseDto>():
        return Error(exception: res);
    }
  }
}
