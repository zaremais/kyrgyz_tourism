import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/app/app.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/auth_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/password_reset_confirm_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/register_success_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/password_reset_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/telegram_chat_bot_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/telegram_phone_screen.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/screens/telegram_screen.dart';
import 'package:kyrgyz_tourism/features/booking_tour/presentation/screens/booking_screen.dart';
import 'package:kyrgyz_tourism/features/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/features/categories/presentation/screens/category_screen.dart';
import 'package:kyrgyz_tourism/features/categories/presentation/screens/contact_screen.dart';
import 'package:kyrgyz_tourism/features/chatBot/presentation/chat_screen.dart';
import 'package:kyrgyz_tourism/features/chatBot/presentation/chat_support_screen.dart';
import 'package:kyrgyz_tourism/features/guides/presentation/screens/guide_screen.dart';
import 'package:kyrgyz_tourism/features/home/presentation/screens/home_screen.dart';
import 'package:kyrgyz_tourism/features/home/presentation/screens/main_tab_screen.dart';
import 'package:kyrgyz_tourism/features/home/presentation/screens/notification_screen.dart';
import 'package:kyrgyz_tourism/features/home/presentation/screens/settings_screen.dart';
import 'package:kyrgyz_tourism/features/payment/presentation/screens/payment_screen.dart';
import 'package:kyrgyz_tourism/features/profile/presentation/screens/profile_screen.dart';
import 'package:kyrgyz_tourism/features/reviews/presentation/screens/add_reviews_screen.dart';
import 'package:kyrgyz_tourism/features/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/individual_tours_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/is_booked_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/region_selection_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/register_tour_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/tour_details_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/tour_filter_screen.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/screens/tour_screen.dart';
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
    AutoRoute(page: ContactRoute.page),
    AutoRoute(page: RegionSelectionRoute.page),
    AutoRoute(page: PaymentRoute.page),
    AutoRoute(page: PasswordResetConfirmRoute.page),
    AutoRoute(page: PasswordResetRoute.page),
    AutoRoute(page: TourFilterRoute.page),
    AutoRoute(page: RegisterTourRoute.page),
    AutoRoute(page: AddReviewRoute.page),
  ];
}
