import 'package:kyrgyz_tourism/core/enums/state_status.dart';

class BaseState<T> {
  final T? model;
  final StateStatus status;
  final String? errorMessage;
  final int? secondsRemaining;
  final String? otpCode;
  final bool isOtpConfirmed;

  const BaseState({
    this.model,
    required this.status,
    this.errorMessage,
    this.secondsRemaining,
    this.otpCode,
    this.isOtpConfirmed = false,
  });

  BaseState<T> copyWith({
    T? model,
    StateStatus? status,
    String? errorMessage,
    int? secondsRemaining,
    String? otpCode,
    bool? isOtpConfirmed,
  }) {
    return BaseState<T>(
      model: model ?? this.model,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      otpCode: otpCode ?? this.otpCode,
      isOtpConfirmed: isOtpConfirmed ?? this.isOtpConfirmed,
    );
  }

  @override
  String toString() {
    return 'BaseState(model: $model, status: $status, errorMessage: $errorMessage)';
  }
}

// class BaseState<T> {
//   T? model;
//   StateStatus status;
//   final String? errorMessage;
//   final int? secondsRemaining;

//   BaseState({
//     this.model,
//     required this.status,
//     this.errorMessage,
//     this.secondsRemaining,
//   });
// }
