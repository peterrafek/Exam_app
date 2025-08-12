import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/dto/verification/response/verify_response_dto.dart';
import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response.dart';
import 'package:injectable/injectable.dart';

import '../../data_source_contract/verification/verification_data_source.dart';
import '../../dto/verification/request/verify_request_dto.dart';

@Injectable(as: VerificationDataSource)
class VreificationDataSourceImpl implements VerificationDataSource {
  ApiClient apiClient;

  @factoryMethod
  VreificationDataSourceImpl(this.apiClient);

  @override
  Future<Result<VerifyResponseEntity>> verify(
      VerifyRequsetEntity request) async {
    var res = await ApiExecutor.executeApi(
      () => apiClient.verificationCode(VerifyRequestDto.toDto(request)),
    );
    switch (res) {
      case Success<VerifyResponseDto>():
        return Success(data: VerifyResponseDto.toEntity(res.data));
      case Error<VerifyResponseDto>():
        return Error(exception: res.exception);
    }
  }
}
