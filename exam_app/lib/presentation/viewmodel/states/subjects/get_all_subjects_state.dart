import '../../../../domain/entities/subjects/subjects_response.dart';

sealed class GetAllSubjectsState {}

class GetAllSubjectsInitialState extends GetAllSubjectsState {}

class GetAllSubjectsLoadingState extends GetAllSubjectsState {}

class GetAllSubjectsSuccessState extends GetAllSubjectsState {
  List<SubjectEntity>? data;

  GetAllSubjectsSuccessState(this.data);
}

class GetAllSubjectsErrorState extends GetAllSubjectsState {
  Exception? exception;

  GetAllSubjectsErrorState({required this.exception});
}
