import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/api_service/reviews_api_service.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/models/reviews_model.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/add_reviews_use_case.dart';

@LazySingleton(as: ReviewsDomainRepository)
class ReviewsRepository extends ReviewsDomainRepository {
  final ReviewsApiService _reviewsApi;
  final TokenStorageService _tokenStorage = TokenStorageService(
    FlutterSecureStorage(),
  );

  ReviewsRepository({required ReviewsApiService reviewsApi})
    : _reviewsApi = reviewsApi;

  @override
  Future<List<ReviewsModel>> getReviews() async {
    final response = await _reviewsApi.getReviews();

    return response;
  }

  @override
  Future<void> addReviews(AddReviewsParams params) async {
    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) {
        throw Exception('Требуется авторизация');
      }

      if (params.rating < 0.1 || params.rating > 5.0) {
        throw Exception('Рейтинг должен быть от 0.1 до 5');
      }

      final response = await _reviewsApi.addReviews(params);

      return response;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  // Exception _handleDioError(DioException e) {
  //   if (e.response?.statusCode == 403) {
  //     return Exception(
  //       e.response?.data?['message'] ??
  //           'Доступ запрещен. Проверьте:\n'
  //               '- Подтвержден ли email\n'
  //               '- Достаточно ли прав вашей роли\n'
  //               '- Активен ли ваш аккаунт',
  //     );
  //   }
  //   return Exception('Ошибка сети: ${e.message}');
  // }
}
