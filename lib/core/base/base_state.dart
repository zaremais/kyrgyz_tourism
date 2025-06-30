import 'package:kyrgyz_tourism/core/enums/state_status.dart';

class BaseState<T> {
  T? model;
  StateStatus status;
  final String? error;
  final int? secondsRemaining;

  BaseState({
    this.model,
    required this.status,
    this.error,
    this.secondsRemaining,
  });
}
