import 'package:bloc/bloc.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/domain/entities/login/requests/login/login_request.dart';
import 'package:exam_app/domain/entities/login/response/login/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result.dart';
import '../../../../domain/usecases/login/log_in_usecase.dart';
import '../../intents/login/log_in_intent.dart';
import '../../states/login/login_state.dart';

@injectable
class LogInCubit extends Cubit<LoginState> {
  GetLogInUsecase _getLogInUsecase;

  // StoreLoginLocalUseCase storeLoginLocalUseCase;

  LogInCubit(this._getLogInUsecase) : super(LoginStateInitialState());

  void doIntent(LogInIntent intent) {
    switch (intent) {
      case OnLogInClickIntent():
        _login(intent.request);
      case OnRememberMeClickIntent():
      // _cashUserInfo(intent.loginResponse);
      case OnForgetPasswordClickIntent():
      case OnSignUpClickIntent():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  bool isChecked = false;

  void _login(LoginRequestEntity request) async {
    emit(LoginStateLoadingState());
    var res = await _getLogInUsecase.execute(request);
    switch (res) {
      case Success<LoginResponseEntity>():
        // _cashUserInfo(res.data);
        emit(LoginStateSuccessState());
      case Error<LoginResponseEntity>():
        emit(LoginStateErrorState(exception: res));
    }
  }


//
// void _cashUserInfo(LoginResponse response) async {
//   if (isChecked) {
//     await storeLoginLocalUseCase.call(response);
//     var user = await storeLoginLocalUseCase.getLocalData();
//     getIt.get<UserProvider>().changeUserLoginInfo(user);
//   }
// }
}
