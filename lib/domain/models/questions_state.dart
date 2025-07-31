
import '../../api/model/response/get_all_question_response.dart';

class QuestionsState {
  final List<Questions> questions;
  final int currentIndex;
  final Map<String, String> selectedAnswers;

  QuestionsState({
    this.questions = const [],
    this.currentIndex = 0,
    this.selectedAnswers = const {},
  });

  QuestionsState copyWith({
    List<Questions>? questions,
    int? currentIndex,
    Map<String, String>? selectedAnswers,
  }) {
    return QuestionsState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}
