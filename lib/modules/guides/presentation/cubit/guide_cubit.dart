import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/guides/data/models/paged_response.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/usecases/get_guide_use_case.dart';

@injectable
class GuideCubit extends Cubit<BaseState<PagedResponse<GuideEntity>>> {
  final GetGuideUseCase _getGuideUseCase;

  GuideCubit({required GetGuideUseCase getGuideUseCase})
    : _getGuideUseCase = getGuideUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> getGuides() async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final response = await _getGuideUseCase.execute(
        params: GuideParams(page: 0, size: 10, sort: 'id,desc'),
      );
      emit(
        BaseState(
          status: StateStatus.success,
          model: PagedResponse(
            content: response.content,
            totalElements: response.totalElements,
            totalPages: response.totalPages,
            number: response.number,
            size: response.size,
            first: response.first,
            last: response.last,
            empty: response.empty,
          ),
        ),
      );
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }
}
