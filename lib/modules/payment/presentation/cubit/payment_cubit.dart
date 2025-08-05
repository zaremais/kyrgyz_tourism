import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/applay_promocode_use_case.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/get_payment_info_use_case.dart';

@injectable
class PaymentCubit extends Cubit<BaseState<PaymentEntity>> {
  final GetPaymentInfoUseCase _getPaymentInfoUseCase;
  final ApplayPromocodeUseCase _applayPromocodeUseCase;

  PaymentCubit({
    required GetPaymentInfoUseCase getPaymentInfoUseCase,
    required ApplayPromocodeUseCase applayPromocodeUseCase,
  }) : _getPaymentInfoUseCase = getPaymentInfoUseCase,
       _applayPromocodeUseCase = applayPromocodeUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getPaymentInfo() async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final result = await _getPaymentInfoUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> applyCode(PromocodeParams params) async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _applayPromocodeUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
