import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/respository_contract/verification/verification_repository.dart';
import '../../api/data_source_contract/verification/verification_data_source.dart';

@Injectable(as: VerificationRepository)
class VreificationRepositoryImpl implements VerificationRepository {
  VerificationDataSource verificationDataSource;

  @factoryMethod
  VreificationRepositoryImpl(this.verificationDataSource);

  @override
  Future<Result<VerifyResponseEntity>> verify(VerifyRequsetEntity request) {
    return verificationDataSource.verify(request);
  }
}
