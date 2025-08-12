import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/domain/entities/sign_up/response/sign_up_response.dart';
import 'package:exam_app/domain/respository_contract/sign_up/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  final SignUpRepo repo;

  SignUpUseCase(this.repo);

  Future<Result<SignUpResponseEntity>> call(SignUpRequestEntity request) {
    return repo.signUp(request);
  }
}
