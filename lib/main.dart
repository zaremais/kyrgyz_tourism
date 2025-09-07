import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/environment.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme_provider.dart';

import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/utils/logger.dart';
import 'package:kyrgyz_tourism/firebase_options.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/locale_provider.dart';

import 'package:kyrgyz_tourism/modules/home/presentation/widgets/kyrgyz_tourism_widget.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.setEnvironment(Environment.dev);
  AppLogger.info('Starting ${AppConfig.appName}', tag: 'APP');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  AppLogger.info('App initialized successfully', tag: 'APP');
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
