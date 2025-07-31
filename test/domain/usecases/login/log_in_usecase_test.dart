import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/login/requests/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login_response.dart';
import 'package:exam_app/domain/respository_contract/login/log_in_repository.dart';
import 'package:exam_app/domain/usecases/login/log_in_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_in_usecase_test.mocks.dart';

@GenerateMocks([LogInRepository])
void main() {
  test('verify calling login from repo', () async {
    var mocLogInRepository = MockLogInRepository();
    GetLogInUsecase usecase = GetLogInUsecase(mocLogInRepository);

    var loginRequestEntity = LoginRequestEntity(
      email: 'moaazhassan559@gmail.com',
      password: 'Moaaz@123',
    );
    var expectedResponse = LoginResponseEntity(
      message: 'Login successful',
      token: 'test_token',
      user: UserEntity(
        id: '123',
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
      ),
    );

    var expectedResult = Success(
      data: expectedResponse,
    );
    provideDummy<Result<LoginResponseEntity>>(expectedResult);

    when(mocLogInRepository.logIn(loginRequestEntity))
        .thenAnswer((_) async => expectedResult);

    var res = await usecase.execute(loginRequestEntity);

    verify(mocLogInRepository.logIn(loginRequestEntity)).called(1);

    expect(res, isA<Success<LoginResponseEntity>>());
    res as Success<LoginResponseEntity>;
    expect(res.data.message, equals('Login successful'));
  });
}
