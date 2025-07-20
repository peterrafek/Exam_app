import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  final String? email;

  ForgetPasswordRequestDto({this.email});

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

  static ForgetPasswordRequestDto toDto(ForgetPasswordRequestEntity entity) {
    return ForgetPasswordRequestDto(email: entity.email);
  }
}
