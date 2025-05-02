import 'package:challenge/services/AuthService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/bloc/Event/LoginEvent.dart';
import 'package:challenge/bloc/State/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(const LoginState()) {
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: "", isSuccess: false));
      try {
        final userData = await authService.login(event.email, event.password);

        if (userData != null) {
          if (userData['message']) {
            emit(
              state.copyWith(
                isLoading: false,
                isSuccess: false,
                errorMessage: userData['message'],
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                isSuccess: true,
                errorMessage: "",
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: false,
              errorMessage: "Email ou mdp incorrect",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: "Erreur inattendue : $e",
          ),
        );
      }
    });
  }
}
