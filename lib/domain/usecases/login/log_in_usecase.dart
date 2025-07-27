import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../respository_contract/login/log_in_repository.dart';

@injectable
class GetLogInUsecase {
  LogInRepository logInRepository;

  @factoryMethod
  GetLogInUsecase(this.logInRepository);

  Future<Result<LoginResponseEntity>> execute(LoginRequestEntity request) {
    return logInRepository.logIn(request);
  }
}
