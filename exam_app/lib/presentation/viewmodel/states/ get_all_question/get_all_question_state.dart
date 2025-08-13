
import 'package:equatable/equatable.dart';

import '../../../api/model/response/get_all_question_response.dart';
import '../../../api/model/response/get_all_question_response.dart' as req;


sealed class GetAllQuestionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllQuestionsInitial extends GetAllQuestionState {}

class GetAllQuestionsLoading extends GetAllQuestionState {}

class GetAllQuestionsSuccess extends GetAllQuestionState {
  final List<req.Questions> questions;
  final int currentIndex;
  final Map<String, String> selectedAnswers;
  GetAllQuestionsSuccess({
    required this.questions,
    this.currentIndex = 0,
    this.selectedAnswers = const {},
  });
  GetAllQuestionsSuccess copyWith({
    List<req.Questions>? questions,
    int? currentIndex,
    Map<String, String>? selectedAnswers,
  }) {
    return GetAllQuestionsSuccess(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
  @override
  List<Object?> get props => [questions];

}

class GetAllQuestionsFailure extends GetAllQuestionState {
  final String message;

  GetAllQuestionsFailure(this.message);
  @override
  List<Object?> get props => [message];
}