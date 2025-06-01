// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i264;

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/auth/data/repositories/auth_repository.dart' as _i135;
import '../../modules/auth/domain/repositories/auth_domain_repository.dart'
    as _i534;
import '../../modules/auth/domain/usecases/get_current_user_use_case.dart'
    as _i1066;
import '../../modules/auth/domain/usecases/get_toke_use_case.dart' as _i848;
import '../../modules/auth/domain/usecases/login_use_case.dart' as _i872;
import '../../modules/auth/domain/usecases/logout_use_case.dart' as _i804;
import '../../modules/auth/domain/usecases/register_use_case.dart' as _i173;
import '../../modules/auth/presentation/cubit/auth_cubit.dart' as _i821;
import '../../modules/profile/data/repositories/profile_repository.dart'
    as _i898;
import '../../modules/profile/domain/repositories/profile_domain_repository.dart'
    as _i89;
import '../../modules/profile/domain/usecases/get_profile_use_case.dart'
    as _i127;
import '../../modules/profile/domain/usecases/update_profile_use_case.dart'
    as _i446;
import '../../modules/profile/presentation/cubit/profile_cubit.dart' as _i514;
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
import '../../modules/tour/domain/usecases/get_tours_use_case.dart' as _i558;
import '../../modules/tour/presentation/cubit/calendar_cubit.dart' as _i98;
import '../../modules/tour/presentation/cubit/favorite_tour_cubit.dart'
    as _i889;
import '../../modules/tour/presentation/cubit/tour_cubit.dart' as _i396;
import '../../modules/users/data/repositories/users_repository.dart' as _i942;
import '../../modules/users/domain/repositories/users_domain_repository.dart'
    as _i729;
import '../../modules/users/domain/usecases/get_user_use_case.dart' as _i277;
import '../../modules/users/presentation/cubit/users_cubit.dart' as _i291;
import '../bloc/theme/theme_cubit.dart' as _i810;
import '../network/dio_client.dart' as _i667;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i667.DioClient>(() => _i667.DioClient());
    gh.factory<_i810.ThemeCubit>(() => _i810.ThemeCubit());
    gh.factory<_i98.CalendarCubit>(() => _i98.CalendarCubit());
    gh.lazySingleton<_i89.ProfileDomainRepository>(
      () => _i898.ProfileRepository(dio: gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i729.UsersDomainRepository>(
      () => _i942.UsersRepository(dio: gh<_i667.DioClient>()),
    );
    gh.factory<_i810.ThemeState>(
      () => _i810.ThemeState(gh<_i264.Brightness>()),
    );
    gh.lazySingleton<_i534.AuthDomainRepository>(
      () => _i135.AuthRepository(dio: gh<_i667.DioClient>()),
    );
    gh.factory<_i173.RegisterParams>(
      () =>
          _i173.RegisterParams(telegramPhone: gh<String>(), code: gh<String>()),
    );
    gh.lazySingleton<_i644.FavoriteToursDomainRepository>(
      () => _i124.FavoriteToursRepository(),
    );
    gh.factory<_i277.GetUserUseCase>(
      () => _i277.GetUserUseCase(repository: gh<_i729.UsersDomainRepository>()),
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
    gh.factory<_i804.LogoutUseCase>(
      () => _i804.LogoutUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i1066.GetCurrentUserUseCase>(
      () => _i1066.GetCurrentUserUseCase(
        repository: gh<_i534.AuthDomainRepository>(),
      ),
    );
    gh.factory<_i173.RegisterUseCase>(
      () => _i173.RegisterUseCase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i872.LoginUsecase>(
      () => _i872.LoginUsecase(repository: gh<_i534.AuthDomainRepository>()),
    );
    gh.factory<_i848.GetTokenUserUseCase>(
      () => _i848.GetTokenUserUseCase(
        repository: gh<_i534.AuthDomainRepository>(),
      ),
    );
    gh.lazySingleton<_i695.TourDomainRepository>(
      () => _i778.TourDataRepository(gh<_i667.DioClient>()),
    );
    gh.factory<_i514.ProfileCubit>(
      () => _i514.ProfileCubit(
        getProfileUseCase: gh<_i127.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i446.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i291.UsersCubit>(
      () => _i291.UsersCubit(getUserUseCase: gh<_i277.GetUserUseCase>()),
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
    gh.factory<_i558.GetToursUseCase>(
      () => _i558.GetToursUseCase(repository: gh<_i695.TourDomainRepository>()),
    );
    gh.factory<_i821.AuthCubit>(
      () => _i821.AuthCubit(
        loginUsecase: gh<_i872.LoginUsecase>(),
        registerUseCase: gh<_i173.RegisterUseCase>(),
        logoutUseCase: gh<_i804.LogoutUseCase>(),
        getCurrentUserUseCase: gh<_i1066.GetCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i889.FavoriteTourCubit>(
      () => _i889.FavoriteTourCubit(
        addFavoriteToursUseCase: gh<_i942.AddFavoriteToursUseCase>(),
        deleteFavoriteTourUseCase: gh<_i773.DeleteFavoriteTourUseCase>(),
        getFavoriteToursUseCase: gh<_i63.GetFavoriteToursUseCase>(),
      ),
    );
    gh.factory<_i396.TourCubit>(
      () => _i396.TourCubit(getTourUsecase: gh<_i558.GetToursUseCase>()),
    );
    return this;
  }
}
