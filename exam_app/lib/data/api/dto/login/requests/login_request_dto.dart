// lib/data/dto/login_request_dto.dart
import 'package:equatable/equatable.dart';
import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto extends Equatable {
  final String? email;
  final String? password;

  LoginRequestDto({this.email, this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

  static LoginRequestDto toDto(LoginRequestEntity entity) {
    return LoginRequestDto(
      email: entity.email,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
