import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/presentation/cubit/auth_cubit.dart';

@RoutePage()
class MainTabScreen extends StatefulWidget {
  final int initialIndex;
  const MainTabScreen({super.key, this.initialIndex = 0});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  final _authCubit = di<AuthCubit>()..appStarted();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authCubit,
      child: AutoTabsRouter(
        routes: [HomeRoute(), CategoryRoute(), ChatRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return BlocListener<AuthCubit, BaseState<bool>>(
            listener: (context, state) {
              if (state.status == StateStatus.success) {
                tabsRouter.setActiveIndex(widget.initialIndex);
              } else if (state.status == StateStatus.error) {
                tabsRouter.setActiveIndex(3);
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
