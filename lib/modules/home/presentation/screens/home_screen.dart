import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_main_app_bar.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/all_guide_button.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/guide_section.dart';
import 'package:kyrgyz_tourism/modules/home/data/models/review_model.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_tour_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/card_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/contact_form.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/double_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/social_links_widget.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/all_reviews.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews._button.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_card.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_list_section.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomMainAppBar(
          imageAppBar: 'assets/images/tour.png',
          showImage: true,
          height: 200,
        ),

        drawer: Drawer(child: Column(children: [CustomDrawer()])),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSizes.paddingMedium),
              DoubleButton(selectedType: selectedType),
              SizedBox(height: AppSizes.borderRadiusMedium),
              ToursListSection(),
              SizedBox(height: AppSizes.paddingLarge),
              AllTourButton(),
              SizedBox(height: AppSizes.paddingHeight),
              GuideSection(),
              SizedBox(height: AppSizes.paddingLarge),
              AllGuideButton(
                onPressed: () {
                  context.router.push(GuideRoute());
                },
              ),
              SizedBox(height: AppSizes.paddingButton),
              ReviewsButton(),
              SizedBox(height: AppSizes.paddingLarge),
              SizedBox(height: AppSizes.paddingButton),
              AllReviews(),
              SizedBox(height: AppSizes.paddingLarge),
              ContactForm(),
              SizedBox(height: AppSizes.paddingButton),
              Divider(),
              SotialLinksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kyrgyz_tourism/core/config/route/route.dart';
// import 'package:kyrgyz_tourism/core/enums/state_status.dart';
// import 'package:kyrgyz_tourism/core/widgets/custom_bottom_navigation_bar.dart';
// import 'package:kyrgyz_tourism/main.dart';
// import 'package:kyrgyz_tourism/modules/home/presentation/providers/language_switch_notifier.dart';
// import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';

// @RoutePage()
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
//   final languageNotifier = LanguageSwitchNotifier();
//   final _tourCubit = di<TourCubit>()..getTours();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: _tourCubit,
//       child: AutoTabsRouter(
//         routes: [
//           MainRoute(),
//           CategoryRoute(),
//           ChatSupportRoute(),
//           ProfileRoute(),
//         ],
//         builder: (context, child) {
//           final tabsRouter = AutoTabsRouter.of(context);
//           return SafeArea(
//             child: Scaffold(
//               body: child,
//               bottomNavigationBar: CustomBottomNavigationBar(
//                 tabsRouter: tabsRouter,
//                 onTap: (index) => _openPage(index, tabsRouter),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _openPage(int index, TabsRouter tabsRouter) {
//     setState(() {
//       tabsRouter.setActiveIndex(index);
//     });
//   }
// }
