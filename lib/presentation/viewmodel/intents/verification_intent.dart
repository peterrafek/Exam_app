import '../../../domain/entities/verification/request/verify_request_entity.dart';

sealed class VerificationIntent {}

class OnContinueClickIntent extends VerificationIntent {
  VerifyRequsetEntity request;

  OnContinueClickIntent({required this.request});
}
