import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_request_dto.g.dart';

@JsonSerializable()
class VerifyRequestDto {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyRequestDto({this.resetCode});

  factory VerifyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestDtoToJson(this);

  static VerifyRequestDto toDto(VerifyRequsetEntity entity) {
    return VerifyRequestDto(resetCode: entity.resetCode);
  }
}
