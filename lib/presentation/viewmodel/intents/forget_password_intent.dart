import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';

sealed class ForgetPasswordIntent {}

class OnEnterdEmailIntent extends ForgetPasswordIntent {
  ForgetPasswordRequestEntity request;

  OnEnterdEmailIntent({required this.request});
}

