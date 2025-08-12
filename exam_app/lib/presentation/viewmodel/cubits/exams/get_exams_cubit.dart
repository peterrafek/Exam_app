import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/exams/get_exams_usecase.dart';
import '../../intents/exams/get_exams_intent.dart';
import '../../states/exams/get_exams_state.dart';

@injectable
class GetExamsCubit extends Cubit<GetExamsState> {
  GetExamsUsecase getExamsUsecase;

  GetExamsCubit(this.getExamsUsecase) : super(GetExamsInitialState());

  void doIntent(GetExamsIntent intent) {
    switch (intent) {
      case OnSubjectClickIntent():
        _getExams(intent.id ?? '');
    }
  }

  void _getExams(String id) async {
    emit(GetExamsLoadingState());
    var res = await getExamsUsecase.execute(id);
    switch (res) {
      case Success<ExamsResponseEntity>():
        emit(GetExamsSuccessState(res.data.exams));
      case Error<ExamsResponseEntity>():
        emit(GetExamsErrorState(exception: res));
    }
  }
}
