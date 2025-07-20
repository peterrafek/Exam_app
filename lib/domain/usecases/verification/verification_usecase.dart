import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../respository_contract/verification/verification_repository.dart';

@injectable
class GetVerificationUsecase {
  VerificationRepository verificationRepository;

  @factoryMethod
  GetVerificationUsecase(this.verificationRepository);

  Future<Result<VerifyResponseEntity>> execute(VerifyRequsetEntity request) {
    return verificationRepository.verify(request);
  }
}
