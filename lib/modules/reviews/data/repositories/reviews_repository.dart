import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/models/reviews_model.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';

@LazySingleton(as: ReviewsDomainRepository)
class ReviewsRepository extends ReviewsDomainRepository {
  final DioClient _dio;

  ReviewsRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<List<ReviewsModel>> getReviews() async {
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

  // @override
  // Future<void> addReviews(ReviewsModel review) async {
  //   try {
  //     final response = await _dio.post(ApiUrls.addReviews);
  //     if (response.statusCode == 200) {
  //       final reviews = response.data;
  //       return reviews.mqp((e) => ReviewsModel.fromJson(e));
  //     } else {
  //       throw Exception('Ошибка при загрузки отзывов: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Ошибка при добавлении отзывов: $e');
  //   }
  // }
}
