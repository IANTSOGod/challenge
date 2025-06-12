import 'package:challenge/services/UtilsService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/bloc/Event/OtpEvent.dart';
import 'package:challenge/bloc/State/OtpState.dart';

class Otpbloc extends Bloc<Otpevent, Otpstate> {
  final Utilsservice utilsservice;

  Otpbloc({required this.utilsservice}) : super(Otpstate()) {
    on<SendOtp>((event, emit) async {
      emit(OtpLoading());
    });

    on<ResetOtp>((event, emit) async {
      emit(OtpInitState());
    });
  }
}
