import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/subjects/get_all_subjects_usecase.dart';
import '../../intents/subjects/get_all_subjects_intent.dart';
import '../../states/subjects/get_all_subjects_state.dart';

@injectable
class GetAllSubjectsCubit extends Cubit<GetAllSubjectsState> {
  GetAllSubjectsUsecase getAllSubjectsUsecase;

  GetAllSubjectsCubit(this.getAllSubjectsUsecase)
      : super(GetAllSubjectsInitialState());

  void doIntent(GetAllSubjetcsIntent intent) {
    switch (intent) {
      case LoadAllSubjectsIntent():
        _getAllSubjects();
    }
  }

  void _getAllSubjects() async {
    emit(GetAllSubjectsLoadingState());
    var res = await getAllSubjectsUsecase.execute();
    switch (res) {
      case Success<SubjectResponseEntity>():
        emit(GetAllSubjectsSuccessState(res.data.subjects));
      case Error<SubjectResponseEntity>():
        emit(GetAllSubjectsErrorState(exception: res.exception));
    }
  }
}
