import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/get_reviews_use_case.dart';

@injectable
class ReviewsCubit extends Cubit<BaseState<List<ReviewsEntity>>> {
  final GetReviewsUseCase _getReviewsUseCase;

  ReviewsCubit({required GetReviewsUseCase getReviewsUseCase})
    : _getReviewsUseCase = getReviewsUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> getReviews() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getReviewsUseCase.execute(params: null);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(
        BaseState(
          status: StateStatus.error,
          error: e is Exception ? e.toString() : 'Неизвусьнаф ошибка',
        ),
      );
    }
  }

  // Future<void> addReviews({required params}) async {
  //   emit(BaseState(status: StateStatus.loading));
  //   try {
  //     await _addReviewsUseCase.execute(params: params);

  //     emit(BaseState(status: StateStatus.success, model: state.model));
  //   } catch (e) {
  //     emit(BaseState(status: StateStatus.error, error: e.toString()));
  //   }
  // }
}
