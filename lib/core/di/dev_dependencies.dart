import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:kyrgyz_tourism/modules/auth/data/repositories/mosk_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/guides/data/repositories/mock_guide_repository.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/repositories/guide_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/reviews/data/repositories/mock_reviews_repository.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/repositories/reviews_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/tour/data/repositories/mock_tour_repository.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/repositories/tour_domain_repository.dart';

Future<void> configureDevDependencies() async {
  if (kDebugMode) {
    final di = GetIt.instance;

    di.allowReassignment = true;
    di.registerLazySingleton<AuthDomainSignInRepository>(
      () => MockAuthSignInRepository(tokenStorage: di()),
    );

    di.registerLazySingleton<TourDomainRepository>(() => MockTourRepository());
    di.registerLazySingleton<GuideDomainRepository>(
      () => MockGuideRepository(),
    );
    di.registerLazySingleton<ReviewsDomainRepository>(
      () => MockReviewsRepository(),
    );
  }
}
