// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [AddReviewScreen]
class AddReviewRoute extends PageRouteInfo<void> {
  const AddReviewRoute({List<PageRouteInfo>? children})
    : super(AddReviewRoute.name, initialChildren: children);

  static const String name = 'AddReviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddReviewScreen();
    },
  );
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppScreen();
    },
  );
}

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
/// [BookingScreen]
class BookingRoute extends PageRouteInfo<BookingRouteArgs> {
  BookingRoute({Key? key, required int tourId, List<PageRouteInfo>? children})
    : super(
        BookingRoute.name,
        args: BookingRouteArgs(key: key, tourId: tourId),
        initialChildren: children,
      );

  static const String name = 'BookingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingRouteArgs>();
      return BookingScreen(key: args.key, tourId: args.tourId);
    },
  );
}

class BookingRouteArgs {
  const BookingRouteArgs({this.key, required this.tourId});

  final Key? key;

  final int tourId;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, tourId: $tourId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingRouteArgs) return false;
    return key == other.key && tourId == other.tourId;
  }

  @override
  int get hashCode => key.hashCode ^ tourId.hashCode;
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
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatScreen();
    },
  );
}

/// generated route for
/// [ChatSupportScreen]
class ChatSupportRoute extends PageRouteInfo<void> {
  const ChatSupportRoute({List<PageRouteInfo>? children})
    : super(ChatSupportRoute.name, initialChildren: children);

  static const String name = 'ChatSupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatSupportScreen();
    },
  );
}

/// generated route for
/// [ContactScreen]
class ContactRoute extends PageRouteInfo<ContactRouteArgs> {
  ContactRoute({
    Key? key,
    required ContactEntity contact,
    List<PageRouteInfo>? children,
  }) : super(
         ContactRoute.name,
         args: ContactRouteArgs(key: key, contact: contact),
         initialChildren: children,
       );

  static const String name = 'ContactRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactRouteArgs>();
      return ContactScreen(key: args.key, contact: args.contact);
    },
  );
}

class ContactRouteArgs {
  const ContactRouteArgs({this.key, required this.contact});

  final Key? key;

  final ContactEntity contact;

  @override
  String toString() {
    return 'ContactRouteArgs{key: $key, contact: $contact}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ContactRouteArgs) return false;
    return key == other.key && contact == other.contact;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode;
}

/// generated route for
/// [GuideScreen]
class GuideRoute extends PageRouteInfo<void> {
  const GuideRoute({List<PageRouteInfo>? children})
    : super(GuideRoute.name, initialChildren: children);

  static const String name = 'GuideRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GuideScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [IndividualToursScreen]
class IndividualToursRoute extends PageRouteInfo<void> {
  const IndividualToursRoute({List<PageRouteInfo>? children})
    : super(IndividualToursRoute.name, initialChildren: children);

  static const String name = 'IndividualToursRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IndividualToursScreen();
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
/// [MainTabScreen]
class MainTabRoute extends PageRouteInfo<MainTabRouteArgs> {
  MainTabRoute({Key? key, int initialIndex = 0, List<PageRouteInfo>? children})
    : super(
        MainTabRoute.name,
        args: MainTabRouteArgs(key: key, initialIndex: initialIndex),
        initialChildren: children,
      );

  static const String name = 'MainTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainTabRouteArgs>(
        orElse: () => const MainTabRouteArgs(),
      );
      return MainTabScreen(key: args.key, initialIndex: args.initialIndex);
    },
  );
}

class MainTabRouteArgs {
  const MainTabRouteArgs({this.key, this.initialIndex = 0});

  final Key? key;

  final int initialIndex;

  @override
  String toString() {
    return 'MainTabRouteArgs{key: $key, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainTabRouteArgs) return false;
    return key == other.key && initialIndex == other.initialIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialIndex.hashCode;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotificationRouteArgs) return false;
    return key == other.key && message == other.message;
  }

  @override
  int get hashCode => key.hashCode ^ message.hashCode;
}

/// generated route for
/// [PasswordResetConfirmScreen]
class PasswordResetConfirmRoute extends PageRouteInfo<void> {
  const PasswordResetConfirmRoute({List<PageRouteInfo>? children})
    : super(PasswordResetConfirmRoute.name, initialChildren: children);

  static const String name = 'PasswordResetConfirmRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordResetConfirmScreen();
    },
  );
}

/// generated route for
/// [PasswordResetScreen]
class PasswordResetRoute extends PageRouteInfo<void> {
  const PasswordResetRoute({List<PageRouteInfo>? children})
    : super(PasswordResetRoute.name, initialChildren: children);

  static const String name = 'PasswordResetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordResetScreen();
    },
  );
}

/// generated route for
/// [PaymentScreen]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
    : super(PaymentRoute.name, initialChildren: children);

  static const String name = 'PaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentScreen();
    },
  );
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
/// [RegionSelectionScreen]
class RegionSelectionRoute extends PageRouteInfo<RegionSelectionRouteArgs> {
  RegionSelectionRoute({
    Key? key,
    required String? selectedRegion,
    required dynamic Function(String) onRegionSelected,
    List<PageRouteInfo>? children,
  }) : super(
         RegionSelectionRoute.name,
         args: RegionSelectionRouteArgs(
           key: key,
           selectedRegion: selectedRegion,
           onRegionSelected: onRegionSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'RegionSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegionSelectionRouteArgs>();
      return RegionSelectionScreen(
        key: args.key,
        selectedRegion: args.selectedRegion,
        onRegionSelected: args.onRegionSelected,
      );
    },
  );
}

class RegionSelectionRouteArgs {
  const RegionSelectionRouteArgs({
    this.key,
    required this.selectedRegion,
    required this.onRegionSelected,
  });

  final Key? key;

  final String? selectedRegion;

  final dynamic Function(String) onRegionSelected;

  @override
  String toString() {
    return 'RegionSelectionRouteArgs{key: $key, selectedRegion: $selectedRegion, onRegionSelected: $onRegionSelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegionSelectionRouteArgs) return false;
    return key == other.key && selectedRegion == other.selectedRegion;
  }

  @override
  int get hashCode => key.hashCode ^ selectedRegion.hashCode;
}

/// generated route for
/// [RegisterSuccessScreen]
class RegisterSuccessRoute extends PageRouteInfo<RegisterSuccessRouteArgs> {
  RegisterSuccessRoute({
    Key? key,
    required String email,
    required String nickname,
    required String password,
    List<PageRouteInfo>? children,
  }) : super(
         RegisterSuccessRoute.name,
         args: RegisterSuccessRouteArgs(
           key: key,
           email: email,
           nickname: nickname,
           password: password,
         ),
         initialChildren: children,
       );

  static const String name = 'RegisterSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterSuccessRouteArgs>();
      return RegisterSuccessScreen(
        key: args.key,
        email: args.email,
        nickname: args.nickname,
        password: args.password,
      );
    },
  );
}

class RegisterSuccessRouteArgs {
  const RegisterSuccessRouteArgs({
    this.key,
    required this.email,
    required this.nickname,
    required this.password,
  });

  final Key? key;

  final String email;

  final String nickname;

  final String password;

  @override
  String toString() {
    return 'RegisterSuccessRouteArgs{key: $key, email: $email, nickname: $nickname, password: $password}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterSuccessRouteArgs) return false;
    return key == other.key &&
        email == other.email &&
        nickname == other.nickname &&
        password == other.password;
  }

  @override
  int get hashCode =>
      key.hashCode ^ email.hashCode ^ nickname.hashCode ^ password.hashCode;
}

/// generated route for
/// [RegisterTourScreen]
class RegisterTourRoute extends PageRouteInfo<void> {
  const RegisterTourRoute({List<PageRouteInfo>? children})
    : super(RegisterTourRoute.name, initialChildren: children);

  static const String name = 'RegisterTourRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterTourScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    void Function()? onPressed,
    List<PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onPressed: onPressed),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return SignInScreen(key: args.key, onPressed: args.onPressed);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onPressed});

  final Key? key;

  final void Function()? onPressed;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onPressed: $onPressed}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    void Function()? onPressed,
    List<PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, onPressed: onPressed),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return SignUpScreen(key: args.key, onPressed: args.onPressed);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.onPressed});

  final Key? key;

  final void Function()? onPressed;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, onPressed: $onPressed}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
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
/// [TelegramChatBotScreen]
class TelegramChatBotRoute extends PageRouteInfo<void> {
  const TelegramChatBotRoute({List<PageRouteInfo>? children})
    : super(TelegramChatBotRoute.name, initialChildren: children);

  static const String name = 'TelegramChatBotRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TelegramChatBotScreen();
    },
  );
}

/// generated route for
/// [TelegramPhoneScreen]
class TelegramPhoneRoute extends PageRouteInfo<TelegramPhoneRouteArgs> {
  TelegramPhoneRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        TelegramPhoneRoute.name,
        args: TelegramPhoneRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'TelegramPhoneRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TelegramPhoneRouteArgs>(
        orElse: () => const TelegramPhoneRouteArgs(),
      );
      return TelegramPhoneScreen(key: args.key);
    },
  );
}

class TelegramPhoneRouteArgs {
  const TelegramPhoneRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TelegramPhoneRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TelegramPhoneRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TourDetailsRouteArgs) return false;
    return key == other.key && tour == other.tour;
  }

  @override
  int get hashCode => key.hashCode ^ tour.hashCode;
}

/// generated route for
/// [TourFilterScreen]
class TourFilterRoute extends PageRouteInfo<void> {
  const TourFilterRoute({List<PageRouteInfo>? children})
    : super(TourFilterRoute.name, initialChildren: children);

  static const String name = 'TourFilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TourFilterScreen();
    },
  );
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
