import 'package:bloc_test/bloc_test.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:exam_app/domain/usecases/login/log_in_usecase.dart';
import 'package:exam_app/presentation/viewmodel/cubits/login/log_in_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/login/log_in_intent.dart';
import 'package:exam_app/presentation/viewmodel/states/login/login_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_in_cubit_test.mocks.dart';

@GenerateMocks([GetLogInUsecase])
void main() {
  var getMockLogInUsecase = MockGetLogInUsecase();
  var cubit = LogInCubit(getMockLogInUsecase);

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
  when(
    getMockLogInUsecase.execute(loginRequestEntity),
  ).thenAnswer(
    (_) async => expectedResult,
  );
  blocTest<LogInCubit,LoginState>(
    'calling doIntent with OnLogInClickIntent should call _login',
    build: () => cubit,
    act: (LogInCubit cubit) {
      cubit.doIntent(
        OnLogInClickIntent(request: loginRequestEntity),
      );
    },
    expect: () => [
      LoginStateLoadingState(),
      LoginStateSuccessState(),
    ],
    verify: (cubit) {
      verify(getMockLogInUsecase.execute(loginRequestEntity)).called(1);
    },
  );
}
