import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme_provider.dart';

import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/firebase_options.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/locale_provider.dart';

import 'package:kyrgyz_tourism/modules/home/presentation/widgets/kyrgyz_tourism_widget.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // if (kDebugMode) {
  //   final di = GetIt.instance;

  //   di.registerLazySingleton<ProfileDomainRepository>(
  //     () => ProfileRepository(
  //       authApi: di(),
  //       tokenStorage: TokenStorageService(FlutterSecureStorage()),
  //     ),
  //   );

  //   di.unregister<AuthDomainSignInRepository>();
  //   di.registerLazySingleton<AuthDomainSignInRepository>(
  //     () => MockAuthSignInRepository(tokenStorage: di()),
  //   );
  // }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: KyrgyzTourism(),
    ),
  );
}
