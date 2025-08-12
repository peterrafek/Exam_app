import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/domain/entities/sign_up/response/sign_up_response.dart';
import 'package:exam_app/domain/respository_contract/sign_up/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/data_source_contract/sign_up/sign_up_data_source.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImpl extends SignUpRepo {
  SignUpDataSource _dataSource;

  SignUpRepoImpl(this._dataSource);

  @override
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequestEntity request) {
    return _dataSource.signUp(request);
  }
}
