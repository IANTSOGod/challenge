import 'package:equatable/equatable.dart';

class Signupstate extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  const Signupstate({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage = "",
  });

  Signupstate copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return Signupstate(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}
