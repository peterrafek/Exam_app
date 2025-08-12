import 'package:dio/dio.dart';
import 'package:exam_app/core/di.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_impl/login/log_in_data_source_impl.dart';
import 'package:exam_app/data/api/dto/login/requests/login_request_dto.dart';
import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';
import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_in_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  MockApiClient mockApiClient = MockApiClient();
  LogInDataSourceImpl logInDataSourceImpl =
      LogInDataSourceImpl(mockApiClient);

  test('verify calling login from API', () async {
    var loginRequestEntity = LoginRequestEntity(
      email: 'moaazhassan559@gmail.com',
      password: 'Moaaz@123',
    );

    when(mockApiClient.login(LoginRequestDto.toDto(loginRequestEntity)))
        .thenAnswer((_) async => LoginResponseDto(
              message: 'Login successful',
              token: 'test_token',
              user: UserDto(
                id: '123',
                email: 'cwc',
              ),
            ));

    var res = await logInDataSourceImpl.logIn(loginRequestEntity);
    verify(mockApiClient.login(LoginRequestDto.toDto(loginRequestEntity)))
        .called(1);

    expect(res, isA<Success<LoginResponseEntity>>());

    res as Success<LoginResponseEntity>;
    expect(res.data.message, equals('Login successful'));
  });
}
