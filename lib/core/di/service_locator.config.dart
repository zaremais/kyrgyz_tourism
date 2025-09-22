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

import '../../features/auth/data/api_service/auth_api_service.dart' as _i489;
import '../../features/auth/data/repositories/auth_password_reset_repository.dart'
    as _i445;
import '../../features/auth/data/repositories/auth_sign_in_repository.dart'
    as _i75;
import '../../features/auth/data/repositories/auth_sign_up_repository.dart'
    as _i215;
import '../../features/auth/data/repositories/auth_telegram_repository.dart'
    as _i1016;
import '../../features/auth/data/repositories/mosk_sign_in_repository.dart'
    as _i513;
import '../../features/auth/domain/repositories/auth_domain_is_logged_in.dart'
    as _i213;
import '../../features/auth/domain/repositories/auth_domain_password_reset_repository.dart'
    as _i328;
import '../../features/auth/domain/repositories/auth_domain_sign_in_repository.dart'
    as _i236;
import '../../features/auth/domain/repositories/auth_domain_sign_up_repository.dart'
    as _i1002;
import '../../features/auth/domain/repositories/auth_domain_telegram_repository.dart'
    as _i959;
import '../../features/auth/domain/usecases/check_nickname_use_case.dart'
    as _i574;
import '../../features/auth/domain/usecases/get_otp_link_use_case.dart'
    as _i749;
import '../../features/auth/domain/usecases/get_remembe_use_case.dart' as _i342;
import '../../features/auth/domain/usecases/is_logged_in_use_case.dart'
    as _i437;
import '../../features/auth/domain/usecases/password_reset_confirm_use_case.dart'
    as _i492;
import '../../features/auth/domain/usecases/password_reset_use_case.dart'
    as _i986;
import '../../features/auth/domain/usecases/refresh_token_use_case.dart'
    as _i300;
import '../../features/auth/domain/usecases/register_otp_use_case.dart'
    as _i555;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i770;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i112;
import '../../features/auth/domain/usecases/telegram_confirm_use_case.dart'
    as _i815;
import '../../features/auth/domain/usecases/verify_code_use_case.dart' as _i209;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i821;
import '../../features/auth/presentation/cubit/check_nickname_cubit.dart'
    as _i134;
import '../../features/auth/presentation/cubit/password_reset_confirm_cubit.dart'
    as _i643;
import '../../features/auth/presentation/cubit/password_reset_cubit.dart'
    as _i921;
import '../../features/auth/presentation/cubit/register_success_cubit.dart'
    as _i52;
import '../../features/auth/presentation/cubit/sign_in_cubit.dart' as _i726;
import '../../features/auth/presentation/cubit/sign_up_cubit.dart' as _i112;
import '../../features/auth/presentation/cubit/telegram_confirm_cubit.dart'
    as _i371;
import '../../features/auth/presentation/cubit/telegram_otp_cubit.dart' as _i32;
import '../../features/auth/presentation/cubit/verify_code_cubit.dart'
    as _i1007;
import '../../features/booking_tour/data/api_service/booking_tour_api_service.dart'
    as _i755;
import '../../features/booking_tour/data/repositories/booking_tour_repository.dart'
    as _i806;
import '../../features/booking_tour/domain/repositories/booking_domain_repository.dart'
    as _i80;
import '../../features/booking_tour/domain/usecases/booking_date_use_case.dart'
    as _i340;
import '../../features/booking_tour/domain/usecases/booking_tour_use_case.dart'
    as _i396;
import '../../features/booking_tour/domain/usecases/booking_tour_user_use_case.dart'
    as _i280;
import '../../features/booking_tour/presentation/cubit/booking_tour_cubit.dart'
    as _i950;
import '../../features/booking_tour/presentation/cubit/booking_tour_date_cubit.dart'
    as _i340;
import '../../features/categories/data/api_service/contact_api_service.dart'
    as _i355;
import '../../features/categories/data/repositories/contact_repository.dart'
    as _i580;
import '../../features/categories/domain/repositories/contact_domain_repository.dart'
    as _i506;
import '../../features/categories/domain/usecases/get_contact_use_case.dart'
    as _i1036;
import '../../features/categories/domain/usecases/send_contact_use_case.dart'
    as _i903;
import '../../features/categories/presentation/cubit/contact_cubit.dart'
    as _i344;
import '../../features/guides/data/api_service/guide_api_service.dart' as _i607;
import '../../features/guides/data/repositories/mock_guide_repository.dart'
    as _i624;
import '../../features/guides/domain/repositories/guide_domain_repository.dart'
    as _i766;
import '../../features/guides/domain/usecases/get_guide_use_case.dart' as _i112;
import '../../features/guides/presentation/cubit/guide_cubit.dart' as _i675;
import '../../features/home/presentation/cubit/bloc/language_cubit.dart'
    as _i108;
import '../../features/home/presentation/providers/locale_provider.dart'
    as _i1017;
import '../../features/payment/data/repositories/payment_repository.dart'
    as _i689;
import '../../features/payment/domain/repositories/payment_domain_repository.dart'
    as _i341;
import '../../features/payment/domain/usecases/get_payment_qr_code_use_case.dart'
    as _i509;
import '../../features/payment/presentation/cubit/payment_cubit.dart' as _i923;
import '../../features/profile/data/api_service/profile_api.dart' as _i912;
import '../../features/profile/data/repositories/profile_repository.dart'
    as _i898;
import '../../features/profile/domain/repositories/profile_domain_repository.dart'
    as _i89;
import '../../features/profile/domain/usecases/get_profile_use_case.dart'
    as _i127;
import '../../features/profile/domain/usecases/update_profile_use_case.dart'
    as _i446;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i514;
import '../../features/reviews/data/api_service/reviews_api_service.dart'
    as _i473;
import '../../features/reviews/data/repositories/mock_reviews_repository.dart'
    as _i790;
import '../../features/reviews/domain/repositories/reviews_domain_repository.dart'
    as _i903;
import '../../features/reviews/domain/usecases/add_reviews_use_case.dart'
    as _i659;
import '../../features/reviews/domain/usecases/get_reviews_use_case.dart'
    as _i369;
import '../../features/reviews/presentation/cubit/reviews_cubit.dart' as _i568;
import '../../features/tour/data/api_service/tour_api_service.dart' as _i124;
import '../../features/tour/data/repositories/favorite_tour_repository.dart'
    as _i124;
import '../../features/tour/data/repositories/mock_tour_repository.dart'
    as _i325;
import '../../features/tour/data/repositories/tour_repository.dart' as _i778;
import '../../features/tour/domain/repositories/favorite_tour_domain_repository.dart'
    as _i644;
import '../../features/tour/domain/repositories/favoritre_domain_repository.dart'
    as _i121;
import '../../features/tour/domain/repositories/tour_domain_repository.dart'
    as _i695;
import '../../features/tour/domain/usecases/add_favorite_tour_use_case.dart'
    as _i942;
import '../../features/tour/domain/usecases/add_favorite_use_case.dart'
    as _i132;
import '../../features/tour/domain/usecases/delete_favorite_tour_use_case.dart'
    as _i773;
import '../../features/tour/domain/usecases/delete_favorite_use_case.dart'
    as _i589;
import '../../features/tour/domain/usecases/filter_tours_use_case.dart'
    as _i771;
import '../../features/tour/domain/usecases/get_favorite_tour_use_case.dart'
    as _i63;
import '../../features/tour/domain/usecases/get_favorite_use_case.dart'
    as _i570;
import '../../features/tour/domain/usecases/get_individual_tour_use_case.dart'
    as _i620;
import '../../features/tour/domain/usecases/get_tours_use_case.dart' as _i558;
import '../../features/tour/presentation/cubit/favorite_tour_cubit.dart'
    as _i889;
import '../../features/tour/presentation/cubit/tour_cubit.dart' as _i396;
import '../network/connectivity_service.dart' as _i491;
import '../network/dio_client.dart' as _i667;
import '../network/inspector.dart' as _i248;
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
    gh.factory<_i667.DioClient>(() => _i667.DioClient());
    gh.factory<_i248.AuthInterceptor>(() => _i248.AuthInterceptor());
    gh.factory<_i491.ConnectivityService>(() => _i491.ConnectivityService());
    gh.factory<_i108.ToggleLanguageEvent>(() => _i108.ToggleLanguageEvent());
    gh.factory<_i1017.LocaleProvider>(() => _i1017.LocaleProvider());
    gh.factory<_i52.RegisterSuccessCubit>(() => _i52.RegisterSuccessCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i766.GuideDomainRepository>(
      () => _i624.MockGuideRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i570.GetFavoriteUseCase>(
      () => _i570.GetFavoriteUseCase(
        repository: gh<_i121.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<_i132.AddFavoriteUseCase>(
      () => _i132.AddFavoriteUseCase(
        repository: gh<_i121.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<_i589.DeleteFavoriteUseCase>(
      () => _i589.DeleteFavoriteUseCase(
        repository: gh<_i121.FavoriteDomainRepository>(),
      ),
    );
    gh.factory<_i112.GetGuideUseCase>(
      () =>
          _i112.GetGuideUseCase(repository: gh<_i766.GuideDomainRepository>()),
    );
    gh.lazySingleton<_i341.PaymentDomainRepository>(
      () => _i689.PaymentRepository(dio: gh<_i667.DioClient>()),
    );
    gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i903.ReviewsDomainRepository>(
      () => _i790.MockReviewsRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i695.TourDomainRepository>(
      () => _i325.MockTourRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i644.FavoriteToursDomainRepository>(
      () => _i124.FavoriteToursRepository(),
    );
    gh.factory<_i437.IsLoggedInUseCase>(
      () => _i437.IsLoggedInUseCase(
        repository: gh<_i213.AuthDomainIsLoggedInRepository>(),
      ),
    );
    gh.factory<_i771.FilterTourUseCase>(
      () =>
          _i771.FilterTourUseCase(repository: gh<_i695.TourDomainRepository>()),
    );
    gh.factory<_i620.GetIndividualTourUseCase>(
      () => _i620.GetIndividualTourUseCase(
        repository: gh<_i695.TourDomainRepository>(),
      ),
    );
    gh.factory<_i558.GetToursUseCase>(
      () => _i558.GetToursUseCase(repository: gh<_i695.TourDomainRepository>()),
    );
    gh.factory<_i509.GetPaymentQrCodeUseCase>(
      () => _i509.GetPaymentQrCodeUseCase(
        repository: gh<_i341.PaymentDomainRepository>(),
      ),
    );
    gh.factory<_i821.AuthCubit>(
      () => _i821.AuthCubit(isLoggedInUseCase: gh<_i437.IsLoggedInUseCase>()),
    );
    gh.factory<_i659.AddReviewsUseCase>(
      () => _i659.AddReviewsUseCase(
        repository: gh<_i903.ReviewsDomainRepository>(),
      ),
    );
    gh.factory<_i369.GetReviewsUseCase>(
      () => _i369.GetReviewsUseCase(
        repository: gh<_i903.ReviewsDomainRepository>(),
      ),
    );
    gh.lazySingleton<_i227.TokenStorageService>(
      () => _i227.TokenStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i248.AuthInterceptor>(),
        gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i675.GuideCubit>(
      () => _i675.GuideCubit(getGuideUseCase: gh<_i112.GetGuideUseCase>()),
    );
    gh.factory<_i396.TourCubit>(
      () => _i396.TourCubit(
        getToursUseCase: gh<_i558.GetToursUseCase>(),
        getIndividualTourUseCase: gh<_i620.GetIndividualTourUseCase>(),
        filterTourUseCase: gh<_i771.FilterTourUseCase>(),
      ),
    );
    gh.factory<_i912.ProfileApi>(
      () => _i912.ProfileApi(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i607.GuideApiService>(
      () => _i607.GuideApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i355.ContactApiService>(
      () => _i355.ContactApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i755.BookingTourApiService>(
      () => _i755.BookingTourApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i473.ReviewsApiService>(
      () => _i473.ReviewsApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.lazySingleton<_i489.AuthApiService>(
      () => _i489.AuthApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.lazySingleton<_i124.TourApiService>(
      () => _i124.TourApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.lazySingleton<_i1002.AuthDomainSignUpRepository>(
      () => _i215.AuthSignUpRepository(api: gh<_i489.AuthApiService>()),
    );
    gh.lazySingleton<_i328.AuthDomainPasswordResetdRepository>(
      () => _i445.AuthPasswordResetRepository(api: gh<_i489.AuthApiService>()),
    );
    gh.lazySingleton<_i80.BookingDomainRepository>(
      () => _i806.BookingTourRepository(
        bookingTourApi: gh<_i755.BookingTourApiService>(),
      ),
    );
    gh.lazySingleton<_i236.AuthDomainSignInRepository>(
      () => _i513.MockAuthSignInRepository(
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i695.TourDomainRepository>(
      () => _i778.TourRepository(tourApi: gh<_i124.TourApiService>()),
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
    gh.lazySingleton<_i959.AuthDomainTelegramRepository>(
      () => _i1016.AuthTelegramRepository(api: gh<_i489.AuthApiService>()),
    );
    gh.factory<_i568.ReviewsCubit>(
      () => _i568.ReviewsCubit(
        getReviewsUseCase: gh<_i369.GetReviewsUseCase>(),
        addReviewsUseCase: gh<_i659.AddReviewsUseCase>(),
      ),
    );
    gh.factory<_i923.PaymentCubit>(
      () => _i923.PaymentCubit(
        qrCodeUseCase: gh<_i509.GetPaymentQrCodeUseCase>(),
      ),
    );
    gh.factory<_i280.BookingTourUserUseCase>(
      () => _i280.BookingTourUserUseCase(
        repository: gh<_i80.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i340.BookingDateUseCase>(
      () => _i340.BookingDateUseCase(
        repository: gh<_i80.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i396.BookingTourUseCase>(
      () => _i396.BookingTourUseCase(
        repository: gh<_i80.BookingDomainRepository>(),
      ),
    );
    gh.factory<_i950.BookingTourCubit>(
      () => _i950.BookingTourCubit(
        bookingTourUseCase: gh<_i396.BookingTourUseCase>(),
        bookingDateUseCase: gh<_i340.BookingDateUseCase>(),
      ),
    );
    gh.factory<_i749.GetOtpLinkUseCase>(
      () => _i749.GetOtpLinkUseCase(
        repository: gh<_i959.AuthDomainTelegramRepository>(),
      ),
    );
    gh.factory<_i815.TelegramConfirmUseCase>(
      () => _i815.TelegramConfirmUseCase(
        repository: gh<_i959.AuthDomainTelegramRepository>(),
      ),
    );
    gh.factory<_i555.RegisterOtpUseCase>(
      () => _i555.RegisterOtpUseCase(
        repository: gh<_i959.AuthDomainTelegramRepository>(),
      ),
    );
    gh.lazySingleton<_i236.AuthDomainSignInRepository>(
      () => _i75.AuthSignInRepository(
        api: gh<_i489.AuthApiService>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
    );
    gh.lazySingleton<_i506.ContactDomainRepository>(
      () => _i580.ContactRepository(contactApi: gh<_i355.ContactApiService>()),
    );
    gh.factory<_i986.PasswordResetUseCase>(
      () => _i986.PasswordResetUseCase(
        repository: gh<_i328.AuthDomainPasswordResetdRepository>(),
      ),
    );
    gh.factory<_i492.PasswordResetConfirmUseCase>(
      () => _i492.PasswordResetConfirmUseCase(
        repository: gh<_i328.AuthDomainPasswordResetdRepository>(),
      ),
    );
    gh.factory<_i574.CheckNicknameUseCase>(
      () => _i574.CheckNicknameUseCase(
        repository: gh<_i1002.AuthDomainSignUpRepository>(),
      ),
    );
    gh.factory<_i209.VerifyCodeUseCase>(
      () => _i209.VerifyCodeUseCase(
        repository: gh<_i1002.AuthDomainSignUpRepository>(),
      ),
    );
    gh.lazySingleton<_i112.SignupUseCase>(
      () => _i112.SignupUseCase(
        repository: gh<_i1002.AuthDomainSignUpRepository>(),
      ),
    );
    gh.factory<_i112.SignUpCubit>(
      () => _i112.SignUpCubit(gh<_i112.SignupUseCase>()),
    );
    gh.factory<_i371.TelegramConfirmCubit>(
      () => _i371.TelegramConfirmCubit(
        telegramConfirmUseCase: gh<_i815.TelegramConfirmUseCase>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
      ),
    );
    gh.factory<_i770.SignInUsecase>(
      () => _i770.SignInUsecase(
        repository: gh<_i236.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i300.RefreshTokenUseCase>(
      () => _i300.RefreshTokenUseCase(
        repository: gh<_i236.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i342.GetRemembeUseCase>(
      () => _i342.GetRemembeUseCase(
        repository: gh<_i236.AuthDomainSignInRepository>(),
      ),
    );
    gh.factory<_i889.FavoriteTourCubit>(
      () => _i889.FavoriteTourCubit(
        addFavoriteToursUseCase: gh<_i942.AddFavoriteToursUseCase>(),
        deleteFavoriteTourUseCase: gh<_i773.DeleteFavoriteTourUseCase>(),
        getFavoriteToursUseCase: gh<_i63.GetFavoriteToursUseCase>(),
      ),
    );
    gh.lazySingleton<_i89.ProfileDomainRepository>(
      () => _i898.ProfileRepository(
        authApi: gh<_i489.AuthApiService>(),
        tokenStorage: gh<_i227.TokenStorageService>(),
        dio: gh<_i667.DioClient>(),
        profileApi: gh<_i912.ProfileApi>(),
      ),
    );
    gh.factory<_i921.PasswordResetCubit>(
      () => _i921.PasswordResetCubit(
        resetPasswordUseCase: gh<_i986.PasswordResetUseCase>(),
      ),
    );
    gh.factory<_i903.SendContactUseCase>(
      () => _i903.SendContactUseCase(
        repository: gh<_i506.ContactDomainRepository>(),
      ),
    );
    gh.factory<_i1036.GetContactUseCase>(
      () => _i1036.GetContactUseCase(
        repository: gh<_i506.ContactDomainRepository>(),
      ),
    );
    gh.factory<_i340.BookingTourDateCubit>(
      () => _i340.BookingTourDateCubit(
        bookingDateUseCase: gh<_i340.BookingDateUseCase>(),
      ),
    );
    gh.factory<_i643.PasswordResetConfirmCubit>(
      () => _i643.PasswordResetConfirmCubit(
        confirmUseCase: gh<_i492.PasswordResetConfirmUseCase>(),
      ),
    );
    gh.factory<_i32.TelegramOtpCubit>(
      () => _i32.TelegramOtpCubit(
        sendOtpUseCase: gh<_i555.RegisterOtpUseCase>(),
        confirmOtpUseCase: gh<_i815.TelegramConfirmUseCase>(),
        getOtpLinkUseCase: gh<_i749.GetOtpLinkUseCase>(),
      ),
    );
    gh.factory<_i726.SignInCubit>(
      () => _i726.SignInCubit(
        signInUsecase: gh<_i770.SignInUsecase>(),
        refreshTokenUseCase: gh<_i300.RefreshTokenUseCase>(),
        getRememberUseCase: gh<_i342.GetRemembeUseCase>(),
      ),
    );
    gh.factory<_i134.CheckNicknameCubit>(
      () => _i134.CheckNicknameCubit(
        checkNicknameUseCase: gh<_i574.CheckNicknameUseCase>(),
      ),
    );
    gh.factory<_i1007.VerifyCodeCubit>(
      () => _i1007.VerifyCodeCubit(
        verifyCodeUseCase: gh<_i209.VerifyCodeUseCase>(),
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
    gh.factory<_i344.ContactCubit>(
      () => _i344.ContactCubit(
        getContactUseCase: gh<_i1036.GetContactUseCase>(),
        sendContactUseCase: gh<_i903.SendContactUseCase>(),
      ),
    );
    gh.factory<_i514.ProfileCubit>(
      () => _i514.ProfileCubit(
        getProfileUseCase: gh<_i127.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i446.UpdateProfileUseCase>(),
      ),
    );
    return this;
  }
}

class _$SecureStorageModule extends _i897.SecureStorageModule {}

class _$NetworkModule extends _i567.NetworkModule {}
