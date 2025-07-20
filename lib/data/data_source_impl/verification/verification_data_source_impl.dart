import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/data/api/dto/verification/request/verify_request_dto.dart';
import 'package:exam_app/data/api/dto/verification/response/verify_response_dto.dart';
import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../api/api_client.dart';
import '../../data_source_contract/verification/VerificationDataSource.dart';

@Injectable(as: VerificationDataSource)
class VreificationDataSourceImpl implements VerificationDataSource {
  ApiClient apiClient;

  @factoryMethod
  VreificationDataSourceImpl(this.apiClient);

  @override
  Future<Result<VerifyResponseEntity>> verify(
      VerifyRequsetEntity request) async {
    var res = await ApiExecutor.executeApi(
        () => apiClient.verificationCode(VerifyRequestDto.toDto(request)));
    switch (res) {
      case Success<VerifyResponseDto>():
        return Success(data: VerifyResponseDto.toEntity(res.data));
      case Error<VerifyResponseDto>():
        return Error(exception: res);
    }
  }
}
