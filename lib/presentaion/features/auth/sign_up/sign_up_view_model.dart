import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../api/model/request/sign_up_request.dart';
import '../../../../api/client/api_result.dart';
import '../../../../api/model/response/sign_up_response.dart';
import '../../../../core/strings_manager.dart';
import '../../../../domain/use_case/sign_up_use_case.dart';
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



    signUp(SignUpRequest request) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(request);
    if (result is Success<SignUpResponse>) {
      emit(SignUpSuccess(data: result.data));
    } else if (result is  Failure<SignUpResponse>) {
      final errorMessage = result.exception?.toString() ?? "Unknown error";
      emit(SignUpFailure(
        exception: result.exception ?? Exception(),
        message: errorMessage,
      ));
    }
  }


}
