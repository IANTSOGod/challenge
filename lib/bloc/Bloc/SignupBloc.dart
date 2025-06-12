import 'package:challenge/bloc/Event/SignupEvent.dart';
import 'package:challenge/bloc/State/SignupState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/services/AuthService.dart';

class Signupbloc extends Bloc<SignupEvent, Signupstate> {
  final AuthService authService;

  Signupbloc({required this.authService}) : super(Signupstate()) {
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      print(
        event.email +
            " " +
            event.password +
            " " +
            event.firstname +
            " " +
            event.lastname,
      );
      final userData = await authService.signup(
        event.email,
        event.password,
        event.firstname,
        event.lastname,
      );
      if (userData.statusCode == 201) {
        emit(SignupDone(message: userData.message as String));
      } else {
        emit(SignupError(error: userData.message as String));
      }
    });
  }
}
