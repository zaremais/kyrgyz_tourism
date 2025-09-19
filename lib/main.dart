import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme_provider.dart';
import 'package:kyrgyz_tourism/core/di/dev_dependencies.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/firebase_options.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/locale_provider.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/kyrgyz_tourism_widget.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  await configureDevDependencies();

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
