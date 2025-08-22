import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';

import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/verify_code_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _verifyCubit = di<VerifyCodeCubit>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      final isLoggedIn = _verifyCubit.state.model != null;

      if (isLoggedIn) {
        context.replaceRoute(const AppRoute());
      } else {
        context.replaceRoute(AuthRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
