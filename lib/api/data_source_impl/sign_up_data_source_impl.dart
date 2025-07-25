import 'package:injectable/injectable.dart';

import '../../data/data_source/sign_up_data_source.dart';
 import '../client/api_client.dart';
import '../client/api_result.dart';
import '../model/request/sign_up_request.dart';
import '../model/response/sign_up_response.dart';
@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource{
  ApiClient _apiClient;
  SignUpDataSourceImpl (this._apiClient);
   @override
  Future<Result<SignUpResponse>> signUp(SignUpRequest request) {
    return executeApi(()=>_apiClient.signUp(request)) ;
  }
}