import 'package:bloc/bloc.dart';
import 'package:exam_app/domain/entities/verification/request/verify_request_entity.dart';
import 'package:exam_app/domain/entities/verification/response/verify_response_entity.dart';
import 'package:exam_app/presentation/viewmodel/intents/verification_intent.dart';
import 'package:exam_app/presentation/viewmodel/states/verification_state.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/usecases/verification/verification_usecase.dart';

@injectable
@factoryMethod
class VerificationCubit extends Cubit<VerificationState> {
  GetVerificationUsecase getVerificationUsecase;

  VerificationCubit(this.getVerificationUsecase)
      : super(VerificationInitialState());

  void doIntent(VerificationIntent intent) {
    switch (intent) {
      case OnContinueClickIntent():
        _verify(intent.request);
    }
  }

  void _verify(VerifyRequsetEntity request) async {
    emit(VerificationLoadingState());
    var res = await getVerificationUsecase.execute(request);
    switch (res) {
      case Success<VerifyResponseEntity>():
        print("VerificationCubit emitting VerificationSuccessState");
         emit(VerificationSuccessState());
      case Error<VerifyResponseEntity>():
        emit(VerificationErrorState(exception: res));
    }
  }


}
