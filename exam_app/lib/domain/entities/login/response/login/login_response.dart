import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final String? message;
  final String? token;
  final UserEntity? user;

  LoginResponseEntity({this.message, this.token, this.user});

  @override
  List<Object?> get props => [message, token, user];
}

class UserEntity extends Equatable {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  UserEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        email,
        phone,
        role,
        isVerified,
        createdAt,
      ];
}
