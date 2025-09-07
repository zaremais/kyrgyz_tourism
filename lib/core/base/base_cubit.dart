import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';

import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/error/failure.dart';
import 'package:kyrgyz_tourism/core/utils/logger.dart';

abstract class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseState(status: StateStatus.init));

  Future<void> executeOperation(
    Future<T> Function() operation, {
    String? context,
    T? Function(T)? onSuccess,
    void Function(Failure)? onError,
  }) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      AppLogger.debug('Starting operation', tag: context);

      final result = await operation();

      if (onSuccess != null) {
        final processedResult = onSuccess(result);
        emit(
          state.copyWith(status: StateStatus.success, model: processedResult),
        );
      } else {
        emit(state.copyWith(status: StateStatus.success, model: result));
      }

      AppLogger.debug('Operation completed successfully', tag: context);
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure.unexpected();
      AppLogger.error('Operation failed', tag: context, data: failure.message);

      if (onError != null) {
        onError(failure);
      }

      emit(
        state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message,
        ),
      );
    }
  }

  void reset() {
    emit(BaseState(status: StateStatus.init));
  }
}
