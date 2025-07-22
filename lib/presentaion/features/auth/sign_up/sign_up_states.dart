
import '../../../../api/model/response/sign_up_response.dart';

sealed class SignUpStates{}
class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}
final class SignUpSuccess<T> extends SignUpStates {

  final T? data;

  SignUpSuccess({this.data});
}
final class SignUpFailure extends SignUpStates {

  final Exception? exception;

  SignUpFailure({this.exception});
}