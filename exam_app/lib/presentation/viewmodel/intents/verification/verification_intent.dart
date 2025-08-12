import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';

sealed class VerificationIntent {}

class OnVerificationIntent extends VerificationIntent {
  VerifyRequsetEntity request;

  OnVerificationIntent({required this.request});
}
