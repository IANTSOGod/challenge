import 'package:equatable/equatable.dart';

class Loginstate extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginStateInitial extends Loginstate {}

class LoginStateLoading extends Loginstate {}

// ignore: must_be_immutable
class LoginStateDone extends Loginstate {
  int id;
  String email;
  String password;
  String firstName;
  String lastName;
  String role;
  bool isEmailVerified;
  LoginStateDone({
    required this.id,
    required this.firstName,
    required this.role,
    required this.lastName,
    required this.isEmailVerified,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
    email,
    password,
    id,
    role,
    firstName,
    lastName,
    isEmailVerified,
  ];
}

// ignore: must_be_immutable
class LoginStateError extends Loginstate {
  String error;
  LoginStateError({required this.error});

  @override
  List<Object> get props => [error];
}
