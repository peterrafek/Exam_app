import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response.dart';

import '../../../core/result.dart';

abstract interface class VerificationRepository {
  Future<Result<VerifyResponseEntity>> verify(VerifyRequsetEntity request);
}
