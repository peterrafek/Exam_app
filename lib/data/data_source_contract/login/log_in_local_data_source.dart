


import '../../api/dto/login/responses/login_response_dto.dart';

abstract interface class StoreLogInLocalDataSource {
  Future<void> saveLoginData(LoginResponseDto response);

  Future<LoginResponseDto?> getLoginData();

  Future<void> deleteLoginData();
}
