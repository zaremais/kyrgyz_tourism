import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/verify_code_use_case.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/verify_code_cubit.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final _verifyCubit =
      di<VerifyCodeCubit>()..verifyCode(VerifyCodeParams(code: '12345'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _verifyCubit,
        child: BlocListener<VerifyCodeCubit, BaseState<bool>>(
          listener: (context, state) async {
            if (state.status == StateStatus.success) {
              // final user = await di<AuthRepository>().getCurrentUser();
              context.router.replaceAll([
                MainTabRoute(children: [ProfileRoute()]),
              ]);
            } else if (state.status == StateStatus.failure) {
              context.router.replaceAll([AuthRoute()]);
            }
          },
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
