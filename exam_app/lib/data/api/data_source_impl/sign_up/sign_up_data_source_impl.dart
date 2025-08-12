import 'package:exam_app/data/api/dto/sign_up/response/sign_up_response.dart';
import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/domain/entities/sign_up/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';

import '../../dto/sign_up/request/sign_up_request.dart';
import '../../api_client.dart';
import '../../data_source_contract/sign_up/sign_up_data_source.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource {
  ApiClient _apiClient;

  SignUpDataSourceImpl(this._apiClient);

  @override
  Future<Result<SignUpResponseEntity>> signUp(
      SignUpRequestEntity request) async {
    var res = await ApiExecutor.executeApi(
      () => _apiClient.signUp(SignUpRequestDto.toDto(request)),
    );
    switch (res) {
      case Success<SignUpResponseDto>():
        return Success(data: SignUpResponseDto.toEntity(res.data));
      case Error<SignUpResponseDto>():
       return Error(exception: res.exception);
    }
  }
}
