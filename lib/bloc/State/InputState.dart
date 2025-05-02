import 'package:equatable/equatable.dart';

class InputState extends Equatable {
  final bool isShowing;
  const InputState({this.isShowing = false});

  InputState copyWith({bool? isShowing}) {
    return InputState(isShowing: isShowing ?? this.isShowing);
  }

  @override
  List<Object?> get props => [isShowing];
}
