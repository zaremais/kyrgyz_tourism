import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_main_app_bar.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/all_guide_button.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/guide_section.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_tour_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/contact_form.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/double_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/social_links_widget.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/all_reviews.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews._button.dart';
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
              TourListSection(),
              AllTourButton(),
              SizedBox(height: 44),
              GuideSection(),
              AllGuideButton(
                onPressed: () {
                  context.router.push(GuideRoute());
                },
              ),
              SizedBox(height: 54),
              ReviewsButton(),
              AllReviews(),
              SizedBox(height: AppSizes.paddingLarge),
              ContactForm(),
              SizedBox(height: 54),

              SotialLinksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
