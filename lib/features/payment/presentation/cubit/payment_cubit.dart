import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/features/payment/domain/usecases/get_payment_qr_code_use_case.dart';

@injectable
class PaymentCubit extends Cubit<BaseState<PaymentQrEntity>> {
  final GetPaymentQrCodeUseCase _qrCodeUseCase;

  PaymentCubit({required GetPaymentQrCodeUseCase qrCodeUseCase})
    : _qrCodeUseCase = qrCodeUseCase,

      super(BaseState(status: StateStatus.init));

  Future<void> loadPaymentQr(QrCodeParams params) async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final result = await _qrCodeUseCase.execute(params: params);

      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
