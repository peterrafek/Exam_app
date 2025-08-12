import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exams_response_dto.g.dart';

@JsonSerializable()
class ExamsResponseDto {
  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  ExamsResponseDto({
    this.exams,
  });

  factory ExamsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsResponseDtoToJson(this);
  }

  static ExamsResponseEntity toEntity(ExamsResponseDto dto) {
    return ExamsResponseEntity(
      exams: dto.exams?.map((e) => ExamsDto.toEntity(e)).toList(),
    );
  }
}

@JsonSerializable()
class ExamsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  ExamsDto({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsDtoToJson(this);
  }

  static ExamEntity toEntity(ExamsDto dto) {
    return ExamEntity(
      id: dto.Id,
      title: dto.title,
      duration: dto.duration,
      subject: dto.subject,
      numberOfQuestions: dto.numberOfQuestions,
      active: dto.active,
      createdAt: dto.createdAt,
    );
  }
}
