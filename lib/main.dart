import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:kyrgyz_tourism/firebase_options.dart';
import 'package:kyrgyz_tourism/modules/auth/data/repositories/mosk_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/locale_provider.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/theme_provider.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/kyrgyz_tourism_widget.dart';
import 'package:kyrgyz_tourism/modules/profile/data/repositories/profile_repository.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  if (kDebugMode) {
    final di = GetIt.instance;

    di.registerLazySingleton<ProfileDomainRepository>(
      () => ProfileRepository(
        authApi: di(),
        tokenStorage: TokenStorageService(FlutterSecureStorage()),
      ),
    );

    di.unregister<AuthDomainSignInRepository>();
    di.registerLazySingleton<AuthDomainSignInRepository>(
      () => MockAuthSignInRepository(tokenStorage: di()),
    );
  }

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
