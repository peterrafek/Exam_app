import 'package:dio/dio.dart';
import 'package:exam_app/data/api/dto/forget_password/request/forget_password_request_dto.dart';
import 'package:exam_app/data/api/dto/forget_password/response/forget_password_response_dto.dart';
import 'package:exam_app/data/api/dto/reset_password/request/reset_password_request_dto.dart';
import 'package:exam_app/data/api/dto/verification/response/verify_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'dto/login/requests/login_request_dto.dart';
import 'dto/login/responses/login_response_dto.dart';
import 'dto/reset_password/response/reset_password_response_dto.dart';
import 'dto/verification/request/verify_request_dto.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/v1/auth/signin')
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST('/v1/auth/forgotPassword')
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST('/v1/auth/verifyResetCode')
  Future<VerifyResponseDto> verificationCode(@Body() VerifyRequestDto request);

  @PUT('/v1/auth/resetPassword')
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);
}
