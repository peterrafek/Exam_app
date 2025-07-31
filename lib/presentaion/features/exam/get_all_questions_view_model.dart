import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../api/client/api_result.dart';
import '../../../api/model/response/get_all_question_response.dart';
import '../../../domain/use_case/get_all_question_use_case.dart';

import 'get_all_question_state.dart';

@injectable
class GetAllQuestionsViewModel extends Cubit<GetAllQuestionState> {
final GetAllQuestionUseCase _getAllQuestionUseCase;
final PageController pageController = PageController();
  GetAllQuestionsViewModel(this._getAllQuestionUseCase): super(GetAllQuestionsInitial());



  Future<void> getAllQuestions(String id) async {
    emit(GetAllQuestionsLoading());
    var result = await _getAllQuestionUseCase(id);
    switch (result) {
      case Success<GetAllQuestionResponse>():
        emit(GetAllQuestionsSuccess(questions: result.data.questions ??[]));
      break;
      case Failure<GetAllQuestionResponse>():
        emit(GetAllQuestionsFailure( result.exception?.toString()??result.errorMessage));
        break;
    }
  }
void nextPage() {
  if (state is GetAllQuestionsSuccess) {
    final currentState = state as GetAllQuestionsSuccess;
    if (currentState.currentIndex < currentState.questions.length - 1) {
      pageController.jumpToPage(currentState.currentIndex + 1);
      emit(currentState.copyWith(currentIndex: currentState.currentIndex + 1));
    }
  }
}

void backPage() {
  if (state is GetAllQuestionsSuccess) {
    final currentState = state as GetAllQuestionsSuccess;
    if (currentState.currentIndex > 0) {
      pageController.jumpToPage(currentState.currentIndex - 1);
      emit(currentState.copyWith(currentIndex: currentState.currentIndex - 1));
    }
  }
}

void selectAnswer(String questionId, String answerId) {
  if (state is GetAllQuestionsSuccess) {
    final currentState = state as GetAllQuestionsSuccess;
    final updatedAnswers = Map<String, String>.from(currentState.selectedAnswers)
      ..[questionId] = answerId;

    emit(currentState.copyWith(selectedAnswers: updatedAnswers));
  }
}
}
