import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import '../../../../domain/entities/forget_password/response/forget_password/forget_password_response.dart';
import '../../../../domain/usecases/forget_password/forget_password_usecase.dart';
import '../../intents/forget_password/forget_password_intent.dart';
import '../../states/forget_password/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  GetForgetPasswordUsecase getForgetPasswordUsecase;

  ForgetPasswordCubit(this.getForgetPasswordUsecase)
      : super(ForgetPasswordInitialState());

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case OnConfirmEmailForgetPasswordClickIntent():
        _forgetPassword(intent.request);
    }
  }

  void _forgetPassword(ForgetPasswordRequestEntity request) async {
    emit(ForgetPasswordLoadingState());
    var res = await getForgetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordSuccessState());
      case Error<ForgetPasswordResponseEntity>():
        emit(ForgetPasswordErrorState(exception: res));
    }
  }
}
