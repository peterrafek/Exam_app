import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/domain/entities/sign_up/response/sign_up_response.dart';
import 'package:exam_app/presentation/viewmodel/states/sign_up/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/result.dart';
import '../../../../data/api/dto/sign_up/request/sign_up_request.dart';
import '../../../../data/api/dto/sign_up/response/sign_up_response.dart';
import '../../../../core/strings_manager.dart';
import '../../../../domain/usecases/sign_up/sign_up_use_case.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
    SignUpUseCase _signUpUseCase;
  SignUpViewModel(this._signUpUseCase) : super(SignUpInitial());


    String? validateUserName(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.thisUserNotValid;
      }
      return null;
    }

    String? validateFirstName(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.pleaseEnterYourFirstName;
      }
      return null;
    }

    String? validateLastName(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.pleaseEnterYourLastName;
      }
      return null;
    }

    String? validateEmail(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.thisEmailIsNitValid;
      }
      final isEmailValid = RegExp(StringsManager.emailRegsExp).hasMatch(value);
      if (!isEmailValid) {
        return StringsManager.emailFormatIsWrong;
      }
      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.pleaseEnterYourPassword;
      }
      if (value.length < 6) {
        return StringsManager.passwordShouldBeMore;
      }
      return null;
    }

    String? validateConfirmPassword(String? value, String password) {
      if (value == null || value.isEmpty) {
        return StringsManager.pleaseEnterAPassword;
      }
      if (value != password) {
        return StringsManager.passwordNotMatched;
      }
      return null;
    }

    String? validatePhone(String? value) {
      if (value == null || value.trim().isEmpty) {
        return StringsManager.enterPhoneNumber;
      }

      return null;
    }



    signUp(SignUpRequestEntity request) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(request);
    switch(result) {
      case Success<SignUpResponseEntity>():
       emit(SignUpSuccess(data: result.data));
      case Error<SignUpResponseEntity>():
        final errorMessage = result.exception?.toString() ?? 'unknownError';
        emit(SignUpFailure(
          exception: result.exception,
          message: errorMessage,
        ));
    }
  }
}
