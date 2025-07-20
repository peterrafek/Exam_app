import 'package:bloc/bloc.dart';
import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/domain/entities/forget_password/response/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/usecases/forget_password/forget_password_usecase.dart';
import '../../../domain/usecases/verification/verification_usecase.dart';
import '../intents/forget_password_intent.dart';
import '../states/forget_password_state.dart';

@injectable
@factoryMethod
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  GetForgetPasswordUsecase getForgetPasswordUsecase;

  GetVerificationUsecase getVerificationUsecase;

  ForgetPasswordCubit(
      this.getForgetPasswordUsecase, this.getVerificationUsecase)
      : super(ForgetPasswordInitialState());

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case OnEnterdEmailIntent():
        _enterdEmail(intent.request);
    }
  }

  void _enterdEmail(ForgetPasswordRequestEntity request) async {
    emit(ForgetPasswordLoadingState());
    var res = await getForgetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordSuccessState());
      case Error<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordErrorState(exception: res.exception));
    }
  }
}
