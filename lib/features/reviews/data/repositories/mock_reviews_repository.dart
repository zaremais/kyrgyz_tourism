import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/repositories/reviews_domain_repository.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/usecases/add_reviews_use_case.dart';

@LazySingleton(as: ReviewsDomainRepository, env: [Environment.dev])
class MockReviewsRepository implements ReviewsDomainRepository {
  @override
  Future<List<ReviewsEntity>> getReviews() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ReviewsEntity(
        id: 1,
        name: "Айбек",
        rating: 4.8,
        comment:
            "Очень понравился тур! Гид был профессиональным, атмосфера супер!",
      ),
      ReviewsEntity(
        id: 2,
        name: "Нурай",
        rating: 5.0,
        comment: "Незабываемый опыт! Всё было организовано на высшем уровне.",
      ),
      ReviewsEntity(
        id: 3,
        name: "Алина",
        rating: 4.5,
        comment: "Красивые места, но хотелось бы больше времени на фотосессии.",
      ),
      ReviewsEntity(
        id: 4,
        name: "Данияр",
        rating: 3.9,
        comment: "Тур был хороший, но транспорт мог быть комфортнее.",
      ),
    ];
  }

  @override
  Future<void> addReviews(AddReviewsParams params) {
    throw UnimplementedError();
  }
}
