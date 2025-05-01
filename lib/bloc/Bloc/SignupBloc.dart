import 'package:challenge/bloc/Event/SignupEvent.dart';
import 'package:challenge/bloc/State/SignupState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/services/AuthService.dart';

class Signupbloc extends Bloc<SignupEvent, Signupstate> {
  final AuthService authService;

  Signupbloc({required this.authService}) : super(const Signupstate()) {
    on<SignupSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: "", isSuccess: false));
      try {
        final userData = await authService.signup(
          event.email,
          event.password,
          event.firstname,
          event.lastname,
        );
        if (userData != null) {
          emit(
            state.copyWith(isLoading: false, errorMessage: "", isSuccess: true),
          );
          print("User entered successfully");
        }
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: "Erreur inattendue : $e",
          ),
        );
        print("This is a error");
      }
    });
  }
}
