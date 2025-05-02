import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String firstname;
  final String lastname;

  SignupSubmitted({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  @override
  List<Object?> get props => [email, password, firstname, lastname];
}

class SignupReset extends SignupEvent{}
