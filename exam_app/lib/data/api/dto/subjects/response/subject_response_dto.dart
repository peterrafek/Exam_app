import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/subjects/subjects_response.dart';

part 'subject_response_dto.g.dart';

@JsonSerializable()
class SubjectResponseDto {
  @JsonKey(name: "subjects")
  final List<SubjectsDto>? subjects;

  SubjectResponseDto({
    this.subjects,
  });

  factory SubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseDtoToJson(this);
  }

  static SubjectResponseEntity toEntity(SubjectResponseDto dto) {
    return SubjectResponseEntity(
      subjects: dto.subjects?.map((e) => SubjectsDto.toEntity(e)).toList(),
    );
  }
}

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }

  static SubjectEntity toEntity(SubjectsDto dto) {
    return SubjectEntity(
      id: dto.Id,
      name: dto.name,
      icon: dto.icon,
      createdAt: dto.createdAt,
    );
  }
}
