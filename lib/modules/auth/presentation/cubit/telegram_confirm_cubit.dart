import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_confirm_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';

@injectable
class TelegramConfirmCubit extends Cubit<BaseState<TelegramConfirmEntity>> {
  final TelegramConfirmUseCase _telegramConfirmUseCase;

  TelegramConfirmCubit({required TelegramConfirmUseCase telegramConfirmUseCase})
    : _telegramConfirmUseCase = telegramConfirmUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> confirmOtp({required ConfirmOtpParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _telegramConfirmUseCase.execute(params: params);

      emit(
        BaseState(
          status: StateStatus.success,
          model: result,
          // isOtpConfirmed: true,
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
