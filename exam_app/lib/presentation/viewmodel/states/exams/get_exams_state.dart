import 'package:exam_app/domain/entities/exams/response/exams_response.dart';

sealed class GetExamsState {}

class GetExamsInitialState extends GetExamsState {}

class GetExamsLoadingState extends GetExamsState {}

class GetExamsSuccessState extends GetExamsState {
  List<ExamEntity>? data;

  GetExamsSuccessState(this.data);
}

class GetExamsErrorState extends GetExamsState {
  Object exception;

  GetExamsErrorState({required this.exception});
}
