import 'package:challenge/services/AuthService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/bloc/Event/LoginEvent.dart';
import 'package:challenge/bloc/State/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, Loginstate> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(Loginstate()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginStateLoading());

      final response = await authService.login(event.email, event.password);

      if (response.statusCode == 201) {
        final userData = response.data;

        emit(
          LoginStateDone(
            email: userData['email'],
            id: userData['id'],
            isEmailVerified: userData['isEmailVerified'],
            firstName: userData['firstname'],
            lastName: userData['lastname'],
            password: userData['password'],
            role: userData['role'],
          ),
        );
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        emit(
          LoginStateError(
            error: response.message ?? "Erreur d'authentification",
          ),
        );
      } else {
        emit(
          LoginStateError(
            error: "Une erreur s'est produite. Veuillez réessayer.",
          ),
        );
      }
    });

    on<LoginReset>((event, emit) async {
      emit(LoginStateInitial());
    });
  }
}
