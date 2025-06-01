import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/auth_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/register_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/category_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/home_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/login_screen.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/screens/telegram_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/main_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/message_screen.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/screens/notification_screen.dart';
import 'package:kyrgyz_tourism/modules/profile/presentation/screens/profile_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/is_booked_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/tour_details_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/tour_screen.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';
import 'package:kyrgyz_tourism/modules/users/presentation/screens/users_screen.dart';
import 'package:kyrgyz_tourism/splash_creen.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: TelegramRoute.page),

    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: MessageRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),

    AutoRoute(page: ToursRoute.page),
    AutoRoute(page: TourDetailsRoute.page),
    AutoRoute(page: IsBookedRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: UsersRoute.page),
  ];
}
