import 'package:dio/dio.dart';
import 'package:exam_app/api/client/api_end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../model/request/sign_up_request.dart';
import '../model/response/sign_up_response.dart';


part 'api_client.g.dart';

@injectable
@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @POST(ApiEndPoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest request);

}
