import 'package:exam_app/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "code")
  final int? code;

  ResetPasswordResponseDto({
    this.message,
    this.token,
    this.code,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseDtoToJson(this);
  }

  static ResetPasswordResponseEntity toEntity(ResetPasswordResponseDto dto) {
    return ResetPasswordResponseEntity(
      message: dto.message,
      token: dto.token,
      code: dto.code,
    );
  }
}
