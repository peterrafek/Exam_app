sealed class VerificationState {}

class VerificationInitialState extends VerificationState {}

class VerificationLoadingState extends VerificationState {}

class VerificationSuccessState extends VerificationState {}

class VerificationErrorState extends VerificationState {
  Object exception;

  VerificationErrorState({required this.exception});
}
