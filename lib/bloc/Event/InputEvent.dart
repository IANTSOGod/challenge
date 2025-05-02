import 'package:equatable/equatable.dart';

class InputEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeObscure extends InputEvent {
  final bool isObscure;
  ChangeObscure({required this.isObscure});

  @override
  List<Object?> get props => [isObscure];
}
