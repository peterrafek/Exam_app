import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/login/response/login_response.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto extends Equatable {
  final String? message;
  final String? token;
  final UserDto? user;

  LoginResponseDto({this.message, this.token, this.user});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  static LoginResponseEntity toEntity(LoginResponseDto dto) =>
      LoginResponseEntity(
        message: dto.message,
        token: dto.token,
        user: dto.user?.toUserEntity(dto.user!),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        token,
        user,
      ];

}

@JsonSerializable()
class UserDto  extends Equatable{
  @JsonKey(name: "_id")
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  UserEntity toUserEntity(UserDto dto) => UserEntity(
        id: dto.id,
        username: dto.username,
        firstName: dto.firstName,
        lastName: dto.lastName,
        email: dto.email,
        phone: dto.phone,
        role: dto.role,
        isVerified: dto.isVerified,
        createdAt: dto.createdAt,
      );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    email,
    phone,
    role,
    isVerified,
    createdAt,
  ];
}
