import 'package:kyrgyz_tourism/core/enums/state_status.dart';

class BaseState<T> {
  T? model;
  StateStatus status;
  final String? errorMessage;
  final int? secondsRemaining;
  final String? otpCode;
  final bool isOtpConfirmed;

  BaseState({
    this.model,
    required this.status,
    this.errorMessage,
    this.secondsRemaining,
    this.otpCode,
    this.isOtpConfirmed = false,
  });
}
