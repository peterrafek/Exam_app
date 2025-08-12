import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response.dart';
import 'package:exam_app/presentation/viewmodel/intents/verification/verification_intent.dart';
import 'package:exam_app/presentation/viewmodel/states/verification/verification_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/verification/verification_usecase.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  GetVerificationUsecase getVerificationUsecase;

  VerificationCubit(this.getVerificationUsecase)
      : super(VerificationInitialState());

  void doIntent(VerificationIntent intent) {
    switch (intent) {
      case OnVerificationIntent():
        return _verify(intent.request);
    }
  }

  void _verify(VerifyRequsetEntity request) async {
    emit(VerificationLoadingState());
    var res = await getVerificationUsecase.execute(request);
    switch (res) {
      case Success<VerifyResponseEntity>():
        emit(VerificationSuccessState());
      case Error<VerifyResponseEntity>():
        emit(VerificationErrorState(exception: res));
    }
  }
}
