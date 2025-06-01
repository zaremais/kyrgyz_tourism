import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kyrgyz_tourism/core/bloc/theme/theme_cubit.dart';
// import 'package:kyrgyz_tourism/core/api/firebase_api.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/dark_theme.dart';
import 'package:kyrgyz_tourism/core/config/themes/light_theme.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/firebase_options.dart';

final di = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();
  configureDependencies(di);

  runApp(KyrgyzTourism());
}

class KyrgyzTourism extends StatefulWidget {
  const KyrgyzTourism({super.key});

  @override
  State<KyrgyzTourism> createState() => _KyrgyzTourismState();
}

class _KyrgyzTourismState extends State<KyrgyzTourism> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.isDark ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
