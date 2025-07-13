import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/app/app.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/auth_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/forgot_password_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/register_success_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/reset_password_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/sign_up_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_auth_step_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_chat_bot_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_phone_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_screen.dart';
import 'package:kyrgyz_tourism/modules/categories/presentation/screens/category_screen.dart';
import 'package:kyrgyz_tourism/modules/chatBot/chat_screen.dart';
import 'package:kyrgyz_tourism/modules/chatBot/chat_support_screen.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/screens/guide_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/home_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/main_tab_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/notification_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/settings_screen.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/screens/profile_screen.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/screens/reviews_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/individual_tours_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/is_booked_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/tour_details_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/tour_screen.dart';
import 'package:kyrgyz_tourism/splash_screen.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: AuthRoute.page),
    AutoRoute(
      page: MainTabRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),

    AutoRoute(page: TelegramRoute.page),
    AutoRoute(page: ReviewsRoute.page),
    AutoRoute(page: AppRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: RegisterSuccessRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ToursRoute.page),
    AutoRoute(page: ChatSupportRoute.page),
    AutoRoute(page: IsBookedRoute.page),
    AutoRoute(page: TourDetailsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: GuideRoute.page),
    AutoRoute(page: IndividualToursRoute.page),
    AutoRoute(page: TelegramChatBotRoute.page),
    AutoRoute(page: TelegramPhoneRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    // AutoRoute(page: TelegramAuthStepScreen.page),
  ];
}
