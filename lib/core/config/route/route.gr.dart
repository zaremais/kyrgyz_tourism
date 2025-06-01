// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [CategoryScreen]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
    : super(CategoryRoute.name, initialChildren: children);

  static const String name = 'CategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoryScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [IsBookedScreen]
class IsBookedRoute extends PageRouteInfo<void> {
  const IsBookedRoute({List<PageRouteInfo>? children})
    : super(IsBookedRoute.name, initialChildren: children);

  static const String name = 'IsBookedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IsBookedScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [MessageScreen]
class MessageRoute extends PageRouteInfo<void> {
  const MessageRoute({List<PageRouteInfo>? children})
    : super(MessageRoute.name, initialChildren: children);

  static const String name = 'MessageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MessageScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    Key? key,
    required RemoteMessage message,
    List<PageRouteInfo>? children,
  }) : super(
         NotificationRoute.name,
         args: NotificationRouteArgs(key: key, message: message),
         initialChildren: children,
       );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationRouteArgs>();
      return NotificationScreen(key: args.key, message: args.message);
    },
  );
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key, required this.message});

  final Key? key;

  final RemoteMessage message;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TelegramScreen]
class TelegramRoute extends PageRouteInfo<void> {
  const TelegramRoute({List<PageRouteInfo>? children})
    : super(TelegramRoute.name, initialChildren: children);

  static const String name = 'TelegramRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TelegramScreen();
    },
  );
}

/// generated route for
/// [TourDetailsScreen]
class TourDetailsRoute extends PageRouteInfo<TourDetailsRouteArgs> {
  TourDetailsRoute({
    Key? key,
    required TourEntity tour,
    List<PageRouteInfo>? children,
  }) : super(
         TourDetailsRoute.name,
         args: TourDetailsRouteArgs(key: key, tour: tour),
         initialChildren: children,
       );

  static const String name = 'TourDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TourDetailsRouteArgs>();
      return TourDetailsScreen(key: args.key, tour: args.tour);
    },
  );
}

class TourDetailsRouteArgs {
  const TourDetailsRouteArgs({this.key, required this.tour});

  final Key? key;

  final TourEntity tour;

  @override
  String toString() {
    return 'TourDetailsRouteArgs{key: $key, tour: $tour}';
  }
}

/// generated route for
/// [ToursScreen]
class ToursRoute extends PageRouteInfo<void> {
  const ToursRoute({List<PageRouteInfo>? children})
    : super(ToursRoute.name, initialChildren: children);

  static const String name = 'ToursRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ToursScreen();
    },
  );
}

/// generated route for
/// [UsersScreen]
class UsersRoute extends PageRouteInfo<UsersRouteArgs> {
  UsersRoute({
    Key? key,
    required UsersEntity user,
    List<PageRouteInfo>? children,
  }) : super(
         UsersRoute.name,
         args: UsersRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'UsersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UsersRouteArgs>();
      return UsersScreen(key: args.key, user: args.user);
    },
  );
}

class UsersRouteArgs {
  const UsersRouteArgs({this.key, required this.user});

  final Key? key;

  final UsersEntity user;

  @override
  String toString() {
    return 'UsersRouteArgs{key: $key, user: $user}';
  }
}
