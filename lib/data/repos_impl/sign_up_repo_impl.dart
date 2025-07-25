import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/sign_up_request.dart';
import '../../api/model/response/sign_up_response.dart';
import '../data_source/sign_up_data_source.dart';
 @Injectable(as: SignUpRepo)
class SignUpRepoImpl extends SignUpRepo{
 SignUpDataSource _dataSource;
  SignUpRepoImpl(this._dataSource);
  @override
  Future<Result<SignUpResponse>> signUp(SignUpRequest request) {
    return _dataSource.signUp(request);
   }

}