import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';
import 'package:kyrgyz_tourism/modules/users/domain/usecases/get_user_use_case.dart';

typedef UsersCallback = void Function(dynamic);

@injectable
class UsersCubit extends Cubit<BaseState<List<UsersEntity>>> {
  final GetUserUseCase _getUserUseCase;

  UsersCubit({required GetUserUseCase getUserUseCase})
    : _getUserUseCase = getUserUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> getData() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getUserUseCase.execute(params: state.model);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.error));
    }
  }
}
