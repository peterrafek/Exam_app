import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  SignUpRequestDto ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpRequestDtoToJson(this);
  }
  static SignUpRequestDto toDto(SignUpRequestEntity entity) {
    return SignUpRequestDto(
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      rePassword: entity.rePassword,
      phone: entity.phone,
    );
  }
}


