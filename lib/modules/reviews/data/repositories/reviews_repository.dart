import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/models/reviews_model.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/add_reviews_use_case.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/get_reviews_use_case.dart';

@LazySingleton(as: ReviewsDomainRepository)
class ReviewsRepository extends ReviewsDomainRepository {
  final DioClient _dio;
  final TokenStorageService _tokenStorage = TokenStorageService();

  ReviewsRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<ReviewsModel>> getReviews(ReviewParams params) async {
    try {
      final response = await _dio.get(ApiUrls.getReviews);
      if (response.statusCode == 200) {
        final reviews = response.data as List<dynamic>;
        return reviews.map((e) => ReviewsModel.fromJson(e)).toList();
      } else {
        throw Exception('Ошибка загрузки туров: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка при получении отзывов: $e');
    }
  }

  @override
  Future<ReviewsModel> addReviews(AddReviewsParams params) async {
    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) {
        throw Exception('Требуется авторизация');
      }

      if (params.rating < 0.1 || params.rating > 5.0) {
        throw Exception('Рейтинг должен быть от 0.1 до 5');
      }

      final response = await _dio.post(
        ApiUrls.getReviews,
        data: params.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
          },
          validateStatus: (status) => status == 200,
        ),
      );

      return ReviewsModel.fromJson(response.runtimeType as JSON);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.response?.statusCode == 403) {
      return Exception(
        e.response?.data?['message'] ??
            'Доступ запрещен. Проверьте:\n'
                '- Подтвержден ли email\n'
                '- Достаточно ли прав вашей роли\n'
                '- Активен ли ваш аккаунт',
      );
    }
    return Exception('Ошибка сети: ${e.message}');
  }
}
