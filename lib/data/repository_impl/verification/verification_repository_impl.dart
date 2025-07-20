import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/respository_contract/verification/verification_repository.dart';
import '../../data_source_contract/verification/VerificationDataSource.dart';

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
