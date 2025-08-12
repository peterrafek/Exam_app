import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../respository_contract/login/login_local_repository.dart';

@injectable
class StoreLoginLocalUseCase {
  final StoreLogInLocalRepository _inLocalRepository;

  StoreLoginLocalUseCase(this._inLocalRepository);

  Future<void> call(LoginResponseDto response) {
    return _inLocalRepository.saveLoginData(response);
  }

  Future<LoginResponseDto?> getLocalData() {
    return _inLocalRepository.getLoginData();
  }

  Future<void> clear() {
    return _inLocalRepository.deleteLoginData();
  }
}
