import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/bloc/Event/LoginEvent.dart';
import 'package:challenge/bloc/State/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc(): super(const LoginState()){
    on<LoginSubmitted>((event,emit) async {
      try {
        //A remplacer par le service login
        await Future.delayed(const Duration(seconds: 2));

        if (event.email == "test@example.com" && event.password == "password") {
          emit(state.copyWith(isLoading: false, isSuccess: true));
        } else {
          emit(state.copyWith(
              isLoading: false, errorMessage: "Invalid credentials"));
        }
      } catch (_) {
        emit(state.copyWith(
            isLoading: false, errorMessage: "An unexpected error occurred"));
      }
    });
  }
}