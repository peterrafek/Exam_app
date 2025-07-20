import 'package:equatable/equatable.dart';

sealed class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  Object exception;

  ForgetPasswordErrorState({required this.exception});
}

enum Status { initial, loading, success, error }

class SingleForgetState extends Equatable {
  final Status forgetPasswordStatus;
  final Object? forgetPasswordException;

  const SingleForgetState({
    this.forgetPasswordStatus = Status.initial,
    this.forgetPasswordException,
  });

  SingleForgetState copyWith({
    Status? forgetPasswordStatus,
    Object? forgetPasswordException,
  }) {
    return SingleForgetState(
      forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
      forgetPasswordException:
          forgetPasswordException ?? this.forgetPasswordException,
    );
  }

  @override
  List<Object?> get props => [
        forgetPasswordStatus,
        forgetPasswordException,
      ];
}
