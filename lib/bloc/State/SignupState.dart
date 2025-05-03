import 'package:equatable/equatable.dart';

class Signupstate extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends Signupstate {}

class SignupError extends Signupstate {
  final String error;
  SignupError({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignupDone extends Signupstate {
  final String message;
  SignupDone({required this.message});

  @override
  List<Object?> get props => [message];
}
