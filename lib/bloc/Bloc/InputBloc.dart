import 'package:challenge/bloc/Event/InputEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge/bloc/State/InputState.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputState()) {
    on<ChangeObscure>((event, emit) {
      if (event.isObscure) {
        emit(InputShowing());
      } else {
        emit(InputNotShowing());
      }
    });
  }
}
