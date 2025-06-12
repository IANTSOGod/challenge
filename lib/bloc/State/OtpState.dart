import 'package:equatable/equatable.dart';

class Otpstate extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpInitState extends Otpstate {}

class OtpLoading extends Otpstate{}

class OtpDone extends Otpstate {
  final String confirm;

  OtpDone({required this.confirm});

  @override
  List<Object?> get props => [confirm];
}

class OtpError extends Otpstate {
  final String message;

  OtpError({required this.message});

  @override
  List<Object?> get props => [message];
}
