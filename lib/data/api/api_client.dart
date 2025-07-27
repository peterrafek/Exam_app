import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'dto/login/requests/login_request_dto.dart';
import 'dto/login/responses/login_response_dto.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/v1/auth/signin')
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

}
