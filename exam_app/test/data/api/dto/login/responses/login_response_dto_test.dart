import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity with null values it should return null values', () {
    LoginResponseDto loginDto = LoginResponseDto(
      message: null,
      token: null,
      user: null,
    );
    LoginResponseEntity loginEntity = LoginResponseDto.toEntity(loginDto);
    expect(loginEntity.message, isNull);
    expect(loginEntity.token, isNull);
    expect(loginEntity.user, isNull);
  });
  test('when call toEntity with non-null values it should return right values',
      () {
    LoginResponseDto loginDto = LoginResponseDto(
      message: 'Login successful',
      token: 'abc123',
      user: UserDto(
        id: '1',
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        email: 'moaazhassan559@gmail.com',
      ),
    );
    LoginResponseEntity loginEntity = LoginResponseDto.toEntity(loginDto);
    expect(loginEntity.message, equals(loginDto.message));
    expect(loginEntity.token, equals(loginDto.token));
    expect(
        loginEntity.user, equals(loginDto.user?.toUserEntity(loginDto.user!)));
  });
}
