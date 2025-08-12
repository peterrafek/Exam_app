import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response.dart';
import 'package:injectable/injectable.dart';

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
