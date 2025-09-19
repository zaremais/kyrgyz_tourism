import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/usecases/get_guide_use_case.dart';

@LazySingleton(as: GuideDomainRepository, env: [Environment.dev])
class MockGuideRepository implements GuideDomainRepository {
  @override
  Future<List<GuideEntity>> getGuides(GuideParams params) async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      GuideEntity(
        id: 1,
        name: "Айгуль Турсунбаева",
        image: "https://picsum.photos/200/200?random=1",
        rating: 4.8,
        reviews: 120,
        experience: 5,
        description: "Опытный гид по Чуйской области и Ала-Арче.",
      ),
      GuideEntity(
        id: 2,
        name: "Бакытбек Жумабеков",
        image: "https://picsum.photos/200/200?random=2",
        rating: 4.6,
        reviews: 90,
        experience: 7,
        description: "Специалист по походам в Нарын и озеро Сон-Куль.",
      ),
      GuideEntity(
        id: 3,
        name: "Мээрим Осмонова",
        image: "https://picsum.photos/200/200?random=3",
        rating: 4.9,
        reviews: 150,
        experience: 10,
        description: "Профессиональный гид по Иссык-Кулю и горам Тянь-Шаня.",
      ),
    ];
  }

  @override
  Future<GuideEntity?> getGuideById(int id) {
    throw UnimplementedError();
  }
}
