import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../api/model/request/sign_up_request.dart';
import '../../../../core/api_result/api_result.dart';
import '../../../../domain/use_case/sign_up_use_case.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  SignUpUseCase signUpUseCase;
  SignUpViewModel(this.signUpUseCase) : super(SignUpInitial());

  signUp(SignUpRequest request) async {
    emit(SignUpLoading());
    final result = await signUpUseCase(request);
     switch (result) {
      case OnSuccess<String>():
        emit(SignUpSuccess( data: result));
      case OnFailure<String>():
        emit(SignUpFailure(exception: Exception()));
    }
  }
  //
  // Future<void> signUp(SignUpRequest request) async {
  //   emit(SignUpLoading());
  //   try {
  //     final response = await signUpUseCase(request);
  //     emit(SignUpSuccess(response));
  //   } catch (e) {
  //     emit(SignUpFailure(e.toString()));
  //   }
 // }

}
