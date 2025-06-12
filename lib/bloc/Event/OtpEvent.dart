import 'package:equatable/equatable.dart';

class Otpevent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendOtp extends Otpevent {
  final String otp;

  SendOtp({required this.otp});
  @override
  List<Object?> get props => [otp];
}

class ResetOtp extends Otpevent {
  ResetOtp();
}
