import 'package:bloc/bloc.dart';
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:exam_app/presentation/viewmodel/intents/reset_password_intent.dart';
import 'package:injectable/injectable.dart';

import '../../../core/result.dart';
import '../../../domain/usecases/reset_password/reset_password_usecase.dart';
import '../states/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  GetResetPasswordUsecase getResetPasswordUsecase;

  @factoryMethod
  ResetPasswordCubit(this.getResetPasswordUsecase)
      : super(ResetPasswordInitialState());

  void doIntent(ResetPasswordIntent intent) {
    switch (intent) {
      case OnContinueButtonPressedIntent():
        return _resetPassword(intent.request);
    }
  }

  void _resetPassword(ResetPasswordRequestEntity request) async {
    emit(ResetPasswordLoadingState());
    var res = await getResetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ResetPasswordResponseEntity>():
        print("ResetPasswordCubit emitting ResetPasswordSuccessState");
        emit(ResetPasswordSuccessState());
      case Error<ResetPasswordResponseEntity>():
        emit(ResetPasswordErrorState(exception: res.exception));
    }
  }
}
