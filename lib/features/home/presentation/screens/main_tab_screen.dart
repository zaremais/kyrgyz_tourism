import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:kyrgyz_tourism/features/auth/presentation/cubit/verify_code_cubit.dart';

@RoutePage()
class MainTabScreen extends StatelessWidget {
  final int initialIndex;
  MainTabScreen({super.key, this.initialIndex = 0});

  final _verifyCubit = di<VerifyCodeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _verifyCubit,
      child: AutoTabsRouter(
        routes: [HomeRoute(), CategoryRoute(), ChatRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return BlocListener<VerifyCodeCubit, BaseState<bool>>(
            listener: (context, state) {
              if (state.status == StateStatus.success) {
                tabsRouter.setActiveIndex(initialIndex);
              } else if (state.status == StateStatus.failure) {
                tabsRouter.setActiveIndex(1);
              }
            },
            child: Scaffold(
              body: child,
              bottomNavigationBar: CustomBottomNavigationBar(
                tabsRouter: tabsRouter,
                onTap: tabsRouter.setActiveIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
