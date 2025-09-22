import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/usecases/add_reviews_use_case.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/usecases/get_reviews_use_case.dart';

@injectable
class ReviewsCubit extends Cubit<BaseState<List<ReviewsEntity>>> {
  final GetReviewsUseCase _getReviewsUseCase;
  final AddReviewsUseCase _addReviewsUseCase;

  ReviewsCubit({
    required GetReviewsUseCase getReviewsUseCase,
    required AddReviewsUseCase addReviewsUseCase,
  }) : _getReviewsUseCase = getReviewsUseCase,
       _addReviewsUseCase = addReviewsUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getReviews() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final reviews = await _getReviewsUseCase.execute(params: NoParams());
      emit(BaseState(status: StateStatus.success, model: reviews));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> addReviews({required AddReviewsParams params}) async {
    emit(BaseState(status: StateStatus.loading));
    log('Отправка отзыва: ${params.toJson()}');
    try {
      await _addReviewsUseCase.execute(params: params);
      if (params.rating < 0.1 || params.rating > 5.0) {
        throw Exception('Рейтинг должен быть от 0.1 до 5');
      }
      if (params.comment.isEmpty) {
        throw Exception('Комментарий не может быть пустым');
      }

      emit(BaseState(status: StateStatus.success, model: state.model));
    } catch (e) {
      emit(
        BaseState(
          status: StateStatus.failure,
          errorMessage: e is DioException ? _handleDioError(e) : e.toString(),
        ),
      );
    }
  }

  String _handleDioError(DioException e) {
    if (e.response?.statusCode == 403) {
      return 'Доступ запрещен. Требуется авторизация';
    }
    if (e.response?.statusCode == 400) {
      return 'Некорректные данные: ${e.response?.data?['message']}';
    }
    return e.message ?? 'Ошибка при отправке отзыва';
  }
}
