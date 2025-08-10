import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result.dart';
import '../../../../domain/respository_contract/login/log_in_repository.dart';
import '../../data_source_contract/login/log_in_data_source.dart';

@Injectable(as: LogInRepository)
class LogInRepositoryImpl implements LogInRepository {
  LogInRemoteDataSource _logInDataSource;

  LogInRepositoryImpl(this._logInDataSource);

  @override
  Future<Result<LoginResponseEntity>> logIn(LoginRequestEntity request) {
    return _logInDataSource.logIn(request);
  }
}
