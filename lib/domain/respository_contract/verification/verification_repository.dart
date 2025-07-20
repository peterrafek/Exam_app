
import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response_entity.dart';

import '../../../core/result.dart';

abstract interface class VerificationRepository {
  Future<Result<VerifyResponseEntity>> verify(VerifyRequsetEntity request);
}
