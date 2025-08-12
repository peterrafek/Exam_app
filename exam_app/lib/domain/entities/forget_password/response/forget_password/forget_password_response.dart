import 'package:equatable/equatable.dart';

class ForgetPasswordResponseEntity extends Equatable {
  final String? message;
  final String? info;

  ForgetPasswordResponseEntity({
    this.message,
    this.info,
  });

  @override
  List<Object?> get props => [message, info];
}
