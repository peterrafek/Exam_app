import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../respository_contract/login/log_in_repository.dart';

@injectable
class GetLogInUsecase {
  LogInRepository _logInRepository;


  GetLogInUsecase(this._logInRepository);

  Future<Result<LoginResponseEntity>> execute(LoginRequestEntity request) {
    return _logInRepository.logIn(request);
  }
}
