import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/respository_contract/login/login_local_repository.dart';

import '../../data_source_contract/login/log_in_local_data_source.dart';

@Injectable(as: StoreLogInLocalRepository)
class StoreLoginLocalRepositoryImpl implements StoreLogInLocalRepository {
  final StoreLogInLocalDataSource _localDataSource;

  StoreLoginLocalRepositoryImpl(this._localDataSource);

  @override
  Future<void> saveLoginData(LoginResponseDto response) async {
    return _localDataSource.saveLoginData(response);
  }

  @override
  Future<LoginResponseDto?> getLoginData() async {
    return _localDataSource.getLoginData();
  }

  @override
  Future<void> deleteLoginData() async {
    return _localDataSource.deleteLoginData();
  }
}
