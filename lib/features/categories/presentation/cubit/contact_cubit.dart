import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/features/categories/domain/usecases/get_contact_use_case.dart';
import 'package:kyrgyz_tourism/features/categories/domain/usecases/send_contact_use_case.dart';

@injectable
class ContactCubit extends Cubit<BaseState<ContactEntity>> {
  final GetContactUseCase _getContactUseCase;
  final SendContactUseCase _sendContactUseCase;

  ContactCubit({
    required GetContactUseCase getContactUseCase,
    required SendContactUseCase sendContactUseCase,
  }) : _getContactUseCase = getContactUseCase,
       _sendContactUseCase = sendContactUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getContact() async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final result = await _getContactUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> sendContact({required ContactParams params}) async {
    emit(BaseState(status: StateStatus.init));
    try {
      final result = await _sendContactUseCase.execute(params: params);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
