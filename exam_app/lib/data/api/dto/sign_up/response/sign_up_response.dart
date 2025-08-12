import 'package:exam_app/domain/entities/login/response/login/login_response.dart'
    hide UserEntity;
import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/sign_up/response/sign_up_response.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  SignUpResponseDto({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponseDtoToJson(this);
  }

  static SignUpResponseEntity toEntity(SignUpResponseDto dto) {
    return SignUpResponseEntity(
      message: dto.message,
      token: dto.token,
      user: dto.user != null ? UserDto.toEntity(dto.user!) : null,
    );
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.Id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  static UserEntity toEntity(UserDto dto) {
    return UserEntity(
      username: dto.username,
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
      phone: dto.phone,
      role: dto.role,
      isVerified: dto.isVerified,
      id: dto.Id,
      createdAt: dto.createdAt,
    );
  }
}
