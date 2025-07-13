import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/usecases/get_guide_use_case.dart';

@injectable
class GuideCubit extends Cubit<BaseState<List<GuideEntity>>> {
  final GetGuideUseCase _getGuideUseCase;

  GuideCubit({required GetGuideUseCase getGuideUseCase})
    : _getGuideUseCase = getGuideUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> getGuides() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final guides = await _getGuideUseCase.execute(params: null);
      emit(BaseState(status: StateStatus.success, model: guides));
    } catch (e) {
      emit(BaseState(status: StateStatus.error, errorMessage: e.toString()));
    }
  }
}
