import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:kyrgyz_tourism/features/auth/data/repositories/mosk_sign_in_repository.dart';
import 'package:kyrgyz_tourism/features/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/features/guides/data/repositories/mock_guide_repository.dart';
import 'package:kyrgyz_tourism/features/guides/domain/repositories/guide_domain_repository.dart';
import 'package:kyrgyz_tourism/features/reviews/data/repositories/mock_reviews_repository.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/repositories/reviews_domain_repository.dart';
import 'package:kyrgyz_tourism/features/tour/data/repositories/mock_tour_repository.dart';
import 'package:kyrgyz_tourism/features/tour/domain/repositories/tour_domain_repository.dart';

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
