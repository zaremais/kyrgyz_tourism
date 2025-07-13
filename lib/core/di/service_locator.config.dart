// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/auth/data/repositories/auth_repository.dart' as _i135;
import '../../modules/auth/domain/repositories/auth_domain_repository.dart'
    as _i534;
import '../../modules/auth/domain/usecases/confirm_otp_use_case.dart' as _i437;
import '../../modules/auth/domain/usecases/is_logged_in_use_case.dart' as _i437;
import '../../modules/auth/domain/usecases/reset_password_use_case.dart'
    as _i227;
import '../../modules/auth/domain/usecases/send_otp_use_case.dart' as _i764;
import '../../modules/auth/domain/usecases/sign_in_use_case.dart' as _i770;
import '../../modules/auth/domain/usecases/sign_up_use_case.dart' as _i112;
import '../../modules/auth/presentation/cubit/auth_cubit.dart' as _i821;
import '../../modules/auth/presentation/cubit/register_success_cubit.dart'
    as _i52;
import '../../modules/auth/presentation/cubit/reset_password_cubit.dart'
    as _i897;
import '../../modules/auth/presentation/cubit/sign_in_cubit.dart' as _i726;
import '../../modules/auth/presentation/cubit/sign_up_cubit.dart' as _i112;
import '../../modules/auth/presentation/cubit/telegram_auth_cubit.dart'
    as _i466;
import '../../modules/guides/data/repositories/guide_repository.dart' as _i174;
import '../../modules/guides/domain/repositories/guide_domain_repository.dart'
    as _i766;
import '../../modules/guides/domain/usecases/get_guide_use_case.dart' as _i112;
import '../../modules/guides/presentation/cubit/guide_cubit.dart' as _i675;
import '../../modules/home/presentation/cubit/bloc/language_cubit.dart'
    as _i108;
import '../../modules/home/presentation/providers/locale_provider.dart'
    as _i1017;
import '../../modules/profile/data/repositories/profile_repository.dart'
    as _i898;
import '../../modules/profile/domain/repositories/profile_domain_repository.dart'
    as _i89;
import '../../modules/profile/domain/usecases/get_profile_use_case.dart'
    as _i127;
import '../../modules/profile/domain/usecases/update_profile_use_case.dart'
    as _i446;
import '../../modules/profile/presentation/cubit/profile_cubit.dart' as _i514;
import '../../modules/reviews/data/repositories/reviews_repository.dart'
    as _i1056;
import '../../modules/reviews/domain/repositories/reviews_domain_repository.dart'
    as _i903;
import '../../modules/reviews/domain/usecases/get_reviews_use_case.dart'
    as _i369;
import '../../modules/reviews/presentation/cubit/reviews_cubit.dart' as _i568;
import '../../modules/tour/data/repositories/favorite_tour_repository.dart'
    as _i124;
import '../../modules/tour/data/repositories/tour_repository.dart' as _i778;
import '../../modules/tour/domain/repositories/favorite_tour_domain_repository.dart'
    as _i644;
import '../../modules/tour/domain/repositories/tour_domain_repository.dart'
    as _i695;
import '../../modules/tour/domain/usecases/add_favorite_tour_use_case.dart'
    as _i942;
import '../../modules/tour/domain/usecases/delete_favorite_tour_use_case.dart'
    as _i773;
import '../../modules/tour/domain/usecases/get_favorite_tour_use_case.dart'
    as _i63;
import '../../modules/tour/domain/usecases/get_individual_tour_use_case.dart'
    as _i620;
import '../../modules/tour/domain/usecases/get_tours_use_case.dart' as _i558;
import '../../modules/tour/presentation/cubit/favorite_tour_cubit.dart'
    as _i889;
import '../../modules/tour/presentation/cubit/tour_cubit.dart' as _i396;
import '../network/dio_client.dart' as _i667;
import '../network/storage_secure_storage/storage_secure_service.dart' as _i857;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i667.DioClient>(() => _i667.DioClient());
    gh.factory<_i108.ToggleLanguageEvent>(() => _i108.ToggleLanguageEvent());
    gh.factory<_i1017.LocaleProvider>(() => _i1017.LocaleProvider());
    gh.factory<_i52.RegisterSuccessCubit>(() => _i52.RegisterSuccessCubit());
    gh.factory<_i857.SecureStorage>(() => _i857.SecureStorage());
    gh.lazySingleton<_i903.ReviewsDomainRepository>(
      () => _i1056.ReviewsRepository(dio: gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i89.ProfileDomainRepository>(
      () => _i898.ProfileRepository(dio: gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i766.GuideDomainRepository>(
      () => _i174.GuideRepository(dio: gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i695.TourDomainRepository>(
      () => _i778.TourRepository(dio: gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i534.AuthDomainRepository>(
      () => _i135.AuthRepository(
        dio: gh<_i667.DioClient>(),
        storage: gh<_i857.SecureStorage>(),
      ),
    );
    gh.lazySingleton<_i644.FavoriteToursDomainRepository>(
      () => _i124.FavoriteToursRepository(),
    );
    gh.factory<_i558.GetToursUseCase>(
      () => _i558.GetToursUseCase(repository: gh<_i695.TourDomainRepository>()),
    );
    gh.factory<_i620.GetIndividualTourUseCase>(
      () => _i620.GetIndividualTourUseCase(
        repository: gh<_i695.TourDomainRepository>(),
      ),
    );
    gh.factory<_i369.GetReviewsUseCase>(
      () => _i369.GetReviewsUseCase(
        repository: gh<_i903.ReviewsDomainRepository>(),
      ),
    );
    gh.factory<_i446.UpdateProfileUseCase>(
      () => _i446.UpdateProfileUseCase(
        repository: gh<_i89.ProfileDomainRepository>(),
      ),
    );
    gh.factory<_i127.GetProfileUseCase>(
      () => _i127.GetProfileUseCase(
        repository: gh<_i89.ProfileDomainRepository>(),
      ),
    );
    gh.factory<_i770.SignInUsecase>(
      () => _i770.SignInUsecase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i437.IsLoggedInUseCase>(
      () =>
          _i437.IsLoggedInUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i227.ResetPasswordUseCase>(
      () => _i227.ResetPasswordUseCase(
        repository: gh<_i534.AuthDomainRepository>(),
      ),
    );
    gh.factory<_i764.SendOtpUseCase>(
      () => _i764.SendOtpUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i112.SignupUseCase>(
      () => _i112.SignupUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i437.ConfirmOtpUseCase>(
      () =>
          _i437.ConfirmOtpUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i396.TourCubit>(
      () => _i396.TourCubit(
        getTourUsecase: gh<_i558.GetToursUseCase>(),
        getIndividualUsecase: gh<_i620.GetIndividualTourUseCase>(),
      ),
    );
    gh.factory<_i897.ResetPasswordCubit>(
      () => _i897.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i227.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i112.GetGuideUseCase>(
      () =>
          _i112.GetGuideUseCase(repository: gh<_i766.GuideDomainRepository>()),
    );
    gh.factory<_i514.ProfileCubit>(
      () => _i514.ProfileCubit(
        getProfileUseCase: gh<_i127.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i446.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i568.ReviewsCubit>(
      () =>
          _i568.ReviewsCubit(getReviewsUseCase: gh<_i369.GetReviewsUseCase>()),
    );
    gh.factory<_i773.DeleteFavoriteTourUseCase>(
      () => _i773.DeleteFavoriteTourUseCase(
        repository: gh<_i644.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i63.GetFavoriteToursUseCase>(
      () => _i63.GetFavoriteToursUseCase(
        repository: gh<_i644.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i942.AddFavoriteToursUseCase>(
      () => _i942.AddFavoriteToursUseCase(
        repository: gh<_i644.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i726.SignInCubit>(
      () => _i726.SignInCubit(signInUsecase: gh<_i770.SignInUsecase>()),
    );
    gh.factory<_i466.TelegramAuthCubit>(
      () => _i466.TelegramAuthCubit(
        sendOtpUseCase: gh<_i764.SendOtpUseCase>(),
        confirmOtpUseCase: gh<_i437.ConfirmOtpUseCase>(),
      ),
    );
    gh.factory<_i821.AuthCubit>(
      () => _i821.AuthCubit(isLoggedInUseCase: gh<_i437.IsLoggedInUseCase>()),
    );
    gh.factory<_i112.SignUpCubit>(
      () => _i112.SignUpCubit(gh<_i112.SignupUseCase>()),
    );
    gh.factory<_i675.GuideCubit>(
      () => _i675.GuideCubit(getGuideUseCase: gh<_i112.GetGuideUseCase>()),
    );
    gh.factory<_i889.FavoriteTourCubit>(
      () => _i889.FavoriteTourCubit(
        addFavoriteToursUseCase: gh<_i942.AddFavoriteToursUseCase>(),
        deleteFavoriteTourUseCase: gh<_i773.DeleteFavoriteTourUseCase>(),
        getFavoriteToursUseCase: gh<_i63.GetFavoriteToursUseCase>(),
      ),
    );
    return this;
  }
}
