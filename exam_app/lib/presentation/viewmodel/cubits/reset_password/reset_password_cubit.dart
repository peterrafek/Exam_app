import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/reset_password/request/reset_password_request.dart';
import 'package:exam_app/domain/entities/reset_password/response/reset_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/reset_password/reset_password_usecase.dart';
import '../../states/reset_password/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  GetResetPasswordUsecase getResetPasswordUsecase;

  @factoryMethod
  ResetPasswordCubit(this.getResetPasswordUsecase)
      : super(ResetPasswordInitialState());

  void resetPassword(ResetPasswordRequestEntity request) async {
    emit(ResetPasswordLoadingState());
    var res = await getResetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ResetPasswordResponseEntity>():
        emit(ResetPasswordSuccessState());
      case Error<ResetPasswordResponseEntity>():
        emit(ResetPasswordErrorState(exception: res));
    }
  }
}
