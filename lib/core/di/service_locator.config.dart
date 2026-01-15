// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api_service/auth_api_service.dart' as _i867;
import '../../features/auth/data/repositories/auth_password_reset_repository.dart'
    as _i928;
import '../../features/auth/data/repositories/auth_sign_in_repository.dart'
    as _i916;
import '../../features/auth/data/repositories/auth_sign_up_repository.dart'
    as _i1043;
import '../../features/auth/data/repositories/auth_telegram_repository.dart'
    as _i900;
import '../../features/auth/data/repositories/mosk_sign_in_repository.dart'
    as _i9;
import '../../features/auth/domain/repositories/auth_domain_is_logged_in.dart'
    as _i797;
import '../../features/auth/domain/repositories/auth_domain_password_reset_repository.dart'
    as _i48;
import '../../features/auth/domain/repositories/auth_domain_sign_in_repository.dart'
    as _i139;
import '../../features/auth/domain/repositories/auth_domain_sign_up_repository.dart'
    as _i711;
import '../../features/auth/domain/repositories/auth_domain_telegram_repository.dart'
    as _i1005;
import '../../features/auth/domain/usecases/check_nickname_use_case.dart'
    as _i841;
import '../../features/auth/domain/usecases/get_otp_link_use_case.dart'
    as _i1073;
import '../../features/auth/domain/usecases/get_remembe_use_case.dart' as _i728;
import '../../features/auth/domain/usecases/is_logged_in_use_case.dart'
    as _i247;
import '../../features/auth/domain/usecases/password_reset_confirm_use_case.dart'
    as _i544;
import '../../features/auth/domain/usecases/password_reset_use_case.dart'
    as _i29;
import '../../features/auth/domain/usecases/refresh_token_use_case.dart'
    as _i906;
import '../../features/auth/domain/usecases/register_otp_use_case.dart'
    as _i688;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i362;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i1037;
import '../../features/auth/domain/usecases/telegram_confirm_use_case.dart'
    as _i620;
import '../../features/auth/domain/usecases/verify_code_use_case.dart' as _i926;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/auth/presentation/cubit/check_nickname_cubit.dart'
    as _i509;
import '../../features/auth/presentation/cubit/password_reset_confirm_cubit.dart'
    as _i832;
import '../../features/auth/presentation/cubit/password_reset_cubit.dart'
    as _i271;
import '../../features/auth/presentation/cubit/register_success_cubit.dart'
    as _i646;
import '../../features/auth/presentation/cubit/sign_in_cubit.dart' as _i329;
import '../../features/auth/presentation/cubit/sign_up_cubit.dart' as _i102;
import '../../features/auth/presentation/cubit/telegram_confirm_cubit.dart'
    as _i884;
import '../../features/auth/presentation/cubit/telegram_otp_cubit.dart'
    as _i914;
import '../../features/auth/presentation/cubit/verify_code_cubit.dart' as _i462;
import '../../features/booking_tour/data/api_service/booking_tour_api_service.dart'
    as _i450;
import '../../features/booking_tour/data/repositories/booking_tour_repository.dart'
    as _i1007;
import '../../features/booking_tour/domain/repositories/booking_domain_repository.dart'
    as _i336;
import '../../features/booking_tour/domain/usecases/booking_date_use_case.dart'
    as _i112;
import '../../features/booking_tour/domain/usecases/booking_tour_use_case.dart'
    as _i97;
import '../../features/booking_tour/domain/usecases/booking_tour_user_use_case.dart'
    as _i692;
import '../../features/booking_tour/presentation/cubit/booking_tour_cubit.dart'
    as _i698;
import '../../features/booking_tour/presentation/cubit/booking_tour_date_cubit.dart'
    as _i492;
import '../../features/categories/data/api_service/contact_api_service.dart'
    as _i152;
import '../../features/categories/data/repositories/contact_repository.dart'
    as _i511;
import '../../features/categories/domain/repositories/contact_domain_repository.dart'
    as _i189;
import '../../features/categories/domain/usecases/get_contact_use_case.dart'
    as _i651;
import '../../features/categories/domain/usecases/send_contact_use_case.dart'
    as _i850;
import '../../features/categories/presentation/cubit/contact_cubit.dart'
    as _i589;
import '../../features/guides/data/api_service/guide_api_service.dart' as _i509;
import '../../features/guides/data/repositories/mock_guide_repository.dart'
    as _i199;
import '../../features/guides/domain/repositories/guide_domain_repository.dart'
    as _i738;
import '../../features/guides/domain/usecases/get_guide_use_case.dart' as _i131;
import '../../features/guides/presentation/cubit/guide_cubit.dart' as _i543;
import '../../features/home/presentation/cubit/bloc/language_cubit.dart'
    as _i394;
import '../../features/home/presentation/providers/locale_provider.dart'
    as _i1062;
import '../../features/payment/data/repositories/payment_repository.dart'
    as _i75;
import '../../features/payment/domain/repositories/payment_domain_repository.dart'
    as _i760;
import '../../features/payment/domain/usecases/get_payment_qr_code_use_case.dart'
    as _i281;
import '../../features/payment/presentation/cubit/payment_cubit.dart' as _i513;
import '../../features/profile/data/api_service/profile_api.dart' as _i618;
import '../../features/profile/data/repositories/profile_repository.dart'
    as _i361;
import '../../features/profile/domain/repositories/profile_domain_repository.dart'
    as _i704;
import '../../features/profile/domain/usecases/get_profile_use_case.dart'
    as _i525;
import '../../features/profile/domain/usecases/update_profile_use_case.dart'
    as _i540;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../../features/reviews/data/api_service/reviews_api_service.dart'
    as _i945;
import '../../features/reviews/data/repositories/mock_reviews_repository.dart'
    as _i1021;
import '../../features/reviews/domain/repositories/reviews_domain_repository.dart'
    as _i18;
import '../../features/reviews/domain/usecases/add_reviews_use_case.dart'
    as _i737;
import '../../features/reviews/domain/usecases/get_reviews_use_case.dart'
    as _i1012;
import '../../features/reviews/presentation/cubit/reviews_cubit.dart' as _i494;
import '../../features/tour/data/api_service/tour_api_service.dart' as _i913;
import '../../features/tour/data/repositories/favorite_tour_repository.dart'
    as _i607;
import '../../features/tour/data/repositories/mock_tour_repository.dart'
    as _i784;
import '../../features/tour/data/repositories/tour_repository.dart' as _i465;
import '../../features/tour/domain/repositories/favorite_tour_domain_repository.dart'
    as _i633;
import '../../features/tour/domain/repositories/favoritre_domain_repository.dart'
    as _i807;
import '../../features/tour/domain/repositories/tour_domain_repository.dart'
    as _i545;
import '../../features/tour/domain/usecases/add_favorite_tour_use_case.dart'
    as _i346;
import '../../features/tour/domain/usecases/add_favorite_use_case.dart'
    as _i470;
import '../../features/tour/domain/usecases/delete_favorite_tour_use_case.dart'
    as _i112;
import '../../features/tour/domain/usecases/delete_favorite_use_case.dart'
    as _i488;
import '../../features/tour/domain/usecases/filter_tours_use_case.dart'
    as _i957;
import '../../features/tour/domain/usecases/get_favorite_tour_use_case.dart'
    as _i1059;
import '../../features/tour/domain/usecases/get_favorite_use_case.dart' as _i73;
import '../../features/tour/domain/usecases/get_individual_tour_use_case.dart'
    as _i1073;
import '../../features/tour/domain/usecases/get_tours_use_case.dart' as _i452;
import '../../features/tour/presentation/cubit/favorite_tour_cubit.dart'
    as _i175;
import '../../features/tour/presentation/cubit/tour_cubit.dart' as _i480;
import '../network/connectivity_service.dart' as _i491;
import '../network/dio_client.dart' as _i667;
import '../network/interceptor.dart' as _i159;
import '../network/storage_secure_storage/secure_storage.dart' as _i883;
import '../network/storage_secure_storage/token_storage_service.dart' as _i227;
import 'network_module.dart' as _i567;
import 'secure_storage_module.dart' as _i897;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final secureStorageModule = _$SecureStorageModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i883.SecureStorage>(() => _i883.SecureStorage());
    gh.factory<_i159.AuthInterceptor>(() => _i159.AuthInterceptor());
    gh.factory<_i667.DioClient>(() => _i667.DioClient());
    gh.factory<_i491.ConnectivityService>(() => _i491.ConnectivityService());
    gh.factory<_i394.ToggleLanguageEvent>(() => _i394.ToggleLanguageEvent());
    gh.factory<_i1062.LocaleProvider>(() => _i1062.LocaleProvider());
    gh.factory<_i646.RegisterSuccessCubit>(() => _i646.RegisterSuccessCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i545.TourDomainRepository>(
      () => _i784.MockTourRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i738.GuideDomainRepository>(
      () => _i199.MockGuideRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i73.GetFavoriteUseCase>(
      () => _i73.GetFavoriteUseCase(
        repository: gh<_i807.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<_i470.AddFavoriteUseCase>(
      () => _i470.AddFavoriteUseCase(
        repository: gh<_i807.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<_i488.DeleteFavoriteUseCase>(
      () => _i488.DeleteFavoriteUseCase(
        repository: gh<_i807.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i633.FavoriteToursDomainRepository>(
      () => _i607.FavoriteToursRepository(),
    );
    gh.factory<_i131.GetGuideUseCase>(
      () =>
          _i131.GetGuideUseCase(repository: gh<_i738.GuideDomainRepository>()),
    );
    gh.lazySingleton<_i760.PaymentDomainRepository>(
      () => _i75.PaymentRepository(dio: gh<_i667.DioClient>()),
    );
    gh.factory<_i957.FilterTourUseCase>(
      () =>
          _i957.FilterTourUseCase(repository: gh<_i545.TourDomainRepository>()),
    );
    gh.factory<_i1073.GetIndividualTourUseCase>(
      () => _i1073.GetIndividualTourUseCase(
        repository: gh<_i545.TourDomainRepository>(),
      ),
    );
    gh.factory<_i452.GetToursUseCase>(
      () => _i452.GetToursUseCase(repository: gh<_i545.TourDomainRepository>()),
    );
    gh.lazySingleton<_i18.ReviewsDomainRepository>(
      () => _i1021.MockReviewsRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i227.TokenStorageService>(
      () => _i227.TokenStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i159.AuthInterceptor>(),
        gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i281.GetPaymentQrCodeUseCase>(
      () => _i281.GetPaymentQrCodeUseCase(
        repository: gh<_i760.PaymentDomainRepository>(),
      ),
    );
    gh.factory<_i618.ProfileApi>(
      () => _i618.ProfileApi(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i509.GuideApiService>(
      () => _i509.GuideApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i152.ContactApiService>(
      () => _i152.ContactApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i450.BookingTourApiService>(
      () => _i450.BookingTourApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i945.ReviewsApiService>(
      () => _i945.ReviewsApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.lazySingleton<_i867.AuthApiService>(
      () => _i867.AuthApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.lazySingleton<_i913.TourApiService>(
      () => _i913.TourApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i247.IsLoggedInUseCase>(
      () => _i247.IsLoggedInUseCase(
        repository: gh<_i797.AuthDomainIsLoggedInRepository>(),
      ),
    );
    gh.factory<_i543.GuideCubit>(
      () => _i543.GuideCubit(getGuideUseCase: gh<_i131.GetGuideUseCase>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(isLoggedInUseCase: gh<_i247.IsLoggedInUseCase>()),
    );
    gh.lazySingleton<_i189.ContactDomainRepository>(
      () => _i511.ContactRepository(contactApi: gh<_i152.ContactApiService>()),
    );
    gh.lazySingleton<_i704.ProfileDomainRepository>(
      () => _i361.ProfileRepository(
        authApi: gh<_i867.AuthApiService>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
        dio: gh<_i667.DioClient>(),
        profileApi: gh<_i618.ProfileApi>(),
      ),
    );
    gh.factory<_i540.UpdateProfileUseCase>(
      () => _i540.UpdateProfileUseCase(
        repository: gh<_i704.ProfileDomainRepository>(),
      ),
    );
    gh.factory<_i525.GetProfileUseCase>(
      () => _i525.GetProfileUseCase(
        repository: gh<_i704.ProfileDomainRepository>(),
      ),
    );
    gh.lazySingleton<_i48.AuthDomainPasswordResetdRepository>(
      () => _i928.AuthPasswordResetRepository(api: gh<_i867.AuthApiService>()),
    );
    gh.lazySingleton<_i139.AuthDomainSignInRepository>(
      () => _i916.AuthSignInRepository(
        api: gh<_i867.AuthApiService>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
    );
    gh.factory<_i480.TourCubit>(
      () => _i480.TourCubit(
        getToursUseCase: gh<_i452.GetToursUseCase>(),
        getIndividualTourUseCase: gh<_i1073.GetIndividualTourUseCase>(),
        filterTourUseCase: gh<_i957.FilterTourUseCase>(),
      ),
    );
    gh.factory<_i112.DeleteFavoriteTourUseCase>(
      () => _i112.DeleteFavoriteTourUseCase(
        repository: gh<_i633.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i1059.GetFavoriteToursUseCase>(
      () => _i1059.GetFavoriteToursUseCase(
        repository: gh<_i633.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i346.AddFavoriteToursUseCase>(
      () => _i346.AddFavoriteToursUseCase(
        repository: gh<_i633.FavoriteToursDomainRepository>(),
      ),
    );
    gh.factory<_i175.FavoriteTourCubit>(
      () => _i175.FavoriteTourCubit(
        addFavoriteToursUseCase: gh<_i346.AddFavoriteToursUseCase>(),
        deleteFavoriteTourUseCase: gh<_i112.DeleteFavoriteTourUseCase>(),
        getFavoriteToursUseCase: gh<_i1059.GetFavoriteToursUseCase>(),
      ),
    );
    gh.lazySingleton<_i1005.AuthDomainTelegramRepository>(
      () => _i900.AuthTelegramRepository(api: gh<_i867.AuthApiService>()),
    );
    gh.lazySingleton<_i139.AuthDomainSignInRepository>(
      () => _i9.MockAuthSignInRepository(
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
      registerFor: {_dev},
    );
    gh.factory<_i737.AddReviewsUseCase>(
      () => _i737.AddReviewsUseCase(
        repository: gh<_i18.ReviewsDomainRepository>(),
      ),
    );
    gh.factory<_i1012.GetReviewsUseCase>(
      () => _i1012.GetReviewsUseCase(
        repository: gh<_i18.ReviewsDomainRepository>(),
      ),
    );
    gh.lazySingleton<_i711.AuthDomainSignUpRepository>(
      () => _i1043.AuthSignUpRepository(api: gh<_i867.AuthApiService>()),
    );
    gh.factory<_i362.SignInUsecase>(
      () => _i362.SignInUsecase(
        repository: gh<_i139.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i906.RefreshTokenUseCase>(
      () => _i906.RefreshTokenUseCase(
        repository: gh<_i139.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i728.GetRemembeUseCase>(
      () => _i728.GetRemembeUseCase(
        repository: gh<_i139.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i494.ReviewsCubit>(
      () => _i494.ReviewsCubit(
        getReviewsUseCase: gh<_i1012.GetReviewsUseCase>(),
        addReviewsUseCase: gh<_i737.AddReviewsUseCase>(),
      ),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(
        getProfileUseCase: gh<_i525.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i540.UpdateProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i545.TourDomainRepository>(
      () => _i465.TourRepository(tourApi: gh<_i913.TourApiService>()),
    );
    gh.factory<_i513.PaymentCubit>(
      () => _i513.PaymentCubit(
        qrCodeUseCase: gh<_i281.GetPaymentQrCodeUseCase>(),
      ),
    );
    gh.factory<_i29.PasswordResetUseCase>(
      () => _i29.PasswordResetUseCase(
        repository: gh<_i48.AuthDomainPasswordResetdRepository>(),
      ),
    );
    gh.factory<_i544.PasswordResetConfirmUseCase>(
      () => _i544.PasswordResetConfirmUseCase(
        repository: gh<_i48.AuthDomainPasswordResetdRepository>(),
      ),
    );
    gh.factory<_i329.SignInCubit>(
      () => _i329.SignInCubit(
        signInUsecase: gh<_i362.SignInUsecase>(),
        refreshTokenUseCase: gh<_i906.RefreshTokenUseCase>(),
        getRememberUseCase: gh<_i728.GetRemembeUseCase>(),
      ),
    );
    gh.factory<_i850.SendContactUseCase>(
      () => _i850.SendContactUseCase(
        repository: gh<_i189.ContactDomainRepository>(),
      ),
    );
    gh.factory<_i651.GetContactUseCase>(
      () => _i651.GetContactUseCase(
        repository: gh<_i189.ContactDomainRepository>(),
      ),
    );
    gh.lazySingleton<_i336.BookingDomainRepository>(
      () => _i1007.BookingTourRepository(
        bookingTourApi: gh<_i450.BookingTourApiService>(),
      ),
    );
    gh.factory<_i832.PasswordResetConfirmCubit>(
      () => _i832.PasswordResetConfirmCubit(
        confirmUseCase: gh<_i544.PasswordResetConfirmUseCase>(),
      ),
    );
    gh.factory<_i1073.GetOtpLinkUseCase>(
      () => _i1073.GetOtpLinkUseCase(
        repository: gh<_i1005.AuthDomainTelegramRepository>(),
      ),
    );
    gh.factory<_i620.TelegramConfirmUseCase>(
      () => _i620.TelegramConfirmUseCase(
        repository: gh<_i1005.AuthDomainTelegramRepository>(),
      ),
    );
    gh.factory<_i688.RegisterOtpUseCase>(
      () => _i688.RegisterOtpUseCase(
        repository: gh<_i1005.AuthDomainTelegramRepository>(),
      ),
    );
    gh.lazySingleton<_i1037.SignupUseCase>(
      () => _i1037.SignupUseCase(
        repository: gh<_i711.AuthDomainSignUpRepository>(),
      ),
    );
    gh.factory<_i841.CheckNicknameUseCase>(
      () => _i841.CheckNicknameUseCase(
        repository: gh<_i711.AuthDomainSignUpRepository>(),
      ),
    );
    gh.factory<_i926.VerifyCodeUseCase>(
      () => _i926.VerifyCodeUseCase(
        repository: gh<_i711.AuthDomainSignUpRepository>(),
      ),
    );
    gh.factory<_i589.ContactCubit>(
      () => _i589.ContactCubit(
        getContactUseCase: gh<_i651.GetContactUseCase>(),
        sendContactUseCase: gh<_i850.SendContactUseCase>(),
      ),
    );
    gh.factory<_i271.PasswordResetCubit>(
      () => _i271.PasswordResetCubit(
        resetPasswordUseCase: gh<_i29.PasswordResetUseCase>(),
      ),
    );
    gh.factory<_i914.TelegramOtpCubit>(
      () => _i914.TelegramOtpCubit(
        sendOtpUseCase: gh<_i688.RegisterOtpUseCase>(),
        confirmOtpUseCase: gh<_i620.TelegramConfirmUseCase>(),
        getOtpLinkUseCase: gh<_i1073.GetOtpLinkUseCase>(),
      ),
    );
    gh.factory<_i692.BookingTourUserUseCase>(
      () => _i692.BookingTourUserUseCase(
        repository: gh<_i336.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i112.BookingDateUseCase>(
      () => _i112.BookingDateUseCase(
        repository: gh<_i336.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i97.BookingTourUseCase>(
      () => _i97.BookingTourUseCase(
        repository: gh<_i336.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i884.TelegramConfirmCubit>(
      () => _i884.TelegramConfirmCubit(
        telegramConfirmUseCase: gh<_i620.TelegramConfirmUseCase>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
    );
    gh.factory<_i509.CheckNicknameCubit>(
      () => _i509.CheckNicknameCubit(
        checkNicknameUseCase: gh<_i841.CheckNicknameUseCase>(),
      ),
    );
    gh.factory<_i102.SignUpCubit>(
      () => _i102.SignUpCubit(gh<_i1037.SignupUseCase>()),
    );
    gh.factory<_i462.VerifyCodeCubit>(
      () => _i462.VerifyCodeCubit(
        verifyCodeUseCase: gh<_i926.VerifyCodeUseCase>(),
      ),
    );
    gh.factory<_i492.BookingTourDateCubit>(
      () => _i492.BookingTourDateCubit(
        bookingDateUseCase: gh<_i112.BookingDateUseCase>(),
      ),
    );
    gh.factory<_i698.BookingTourCubit>(
      () => _i698.BookingTourCubit(
        bookingTourUseCase: gh<_i97.BookingTourUseCase>(),
        bookingDateUseCase: gh<_i112.BookingDateUseCase>(),
      ),
    );
    return this;
  }
}

class _$SecureStorageModule extends _i897.SecureStorageModule {}

class _$NetworkModule extends _i567.NetworkModule {}
