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
      final result = await _getGuideUseCase.execute(
        params: GuideParams(size: 10, page: 0, sort: 'id,desc'),
      );
      emit(BaseState(status: StateStatus.success, model: result.content));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
