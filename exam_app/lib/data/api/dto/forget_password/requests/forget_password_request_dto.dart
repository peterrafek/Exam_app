import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto extends Equatable {
  @JsonKey(name: "email")
  final String? email;

  ForgetPasswordRequestDto({
    this.email,
  });

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordRequestDtoToJson(this);
  }

  static ForgetPasswordRequestDto toDto(ForgetPasswordRequestEntity entity) {
    return ForgetPasswordRequestDto(
      email: entity.email,
    );
  }

  @override
  List<Object?> get props => [email];
}


