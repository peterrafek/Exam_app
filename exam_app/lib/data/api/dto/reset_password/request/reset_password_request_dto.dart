import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/reset_password/request/reset_password_request.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "newPassword")
  final String? newPassword;

  ResetPasswordRequestDto({
    this.email,
    this.newPassword,
  });

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);

  static ResetPasswordRequestDto toDto(ResetPasswordRequestEntity entity) {
    return ResetPasswordRequestDto(
      email: entity.email,
      newPassword: entity.newPassword,
    );
  }
}
