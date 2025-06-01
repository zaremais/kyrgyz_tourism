import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/providers/language_switch_notifier.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
  final languageNotifier = LanguageSwitchNotifier();
  final _tourCubit = di<TourCubit>()..getTours();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tourCubit,
      child: AutoTabsRouter(
        routes: [MainRoute(), CategoryRoute(), MessageRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return SafeArea(
            child: Scaffold(
              body: child,
              bottomNavigationBar: CustomBottomNavigationBar(
                tabsRouter: tabsRouter,
                onTap: (index) => _openPage(index, tabsRouter),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() {
      tabsRouter.setActiveIndex(index);
    });
  }
}
