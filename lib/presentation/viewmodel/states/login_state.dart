import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInitialState extends LoginState {}

class LoginStateLoadingState extends LoginState {}

class LoginStateSuccessState extends LoginState {}

class LoginStateErrorState extends LoginState {
  Object exception;

  LoginStateErrorState({required this.exception});
  @override
  List<Object?> get props => [exception];
}
