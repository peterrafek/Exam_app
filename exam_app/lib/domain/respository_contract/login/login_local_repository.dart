import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';

abstract interface class StoreLogInLocalRepository {
  Future<void> saveLoginData(LoginResponseDto request);

  Future<LoginResponseDto?> getLoginData();

  Future<void> deleteLoginData();
}
