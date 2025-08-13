import 'package:dio/dio.dart';
import 'package:exam_app/core/api_endpoints.dart';
import 'package:exam_app/data/api/dto/exams/response/exams_response_dto.dart';
import 'package:exam_app/data/api/dto/forget_password/responses/forget_password_response_dto.dart';
import 'package:exam_app/data/api/dto/reset_password/request/reset_password_request_dto.dart';
import 'package:exam_app/data/api/dto/reset_password/response/reset_password_response_dto.dart';
import 'package:exam_app/data/api/dto/subjects/response/subject_response_dto.dart';
import 'package:exam_app/data/api/dto/verification/response/verify_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'dto/forget_password/requests/forget_password_request_dto.dart';
import 'dto/login/requests/login_request_dto.dart';
import 'dto/login/responses/login_response_dto.dart';
import 'dto/sign_up/request/sign_up_request.dart';
import 'dto/sign_up/response/sign_up_response.dart';
import 'dto/verification/request/verify_request_dto.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiEndpoints.signUp)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto request);

  @POST(ApiEndpoints.login)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiEndpoints.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST(ApiEndpoints.verification)
  Future<VerifyResponseDto> verificationCode(@Body() VerifyRequestDto request);

  @PUT(ApiEndpoints.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);

  @GET(ApiEndpoints.getAllSubjects)
  Future<SubjectResponseDto> getAllSubjects();

  @GET(ApiEndpoints.getExams)
  Future<ExamsResponseDto> getExam(@Query('subject') String id);

  @GET(ApiEndpoints.getAllQuestions)
  Future<GetAllQuestionResponse> getAllQuestion(@Query('exam') String id);
}
