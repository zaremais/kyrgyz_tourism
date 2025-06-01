import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/modules/home/data/models/review_model.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_tour_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/card_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/contact_form.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/double_button.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/social_links_widget.dart';
import 'package:kyrgyz_tourism/modules/tour/data/models/tour_model.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_list_section.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
  final List<TourModel> tours = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
            // GuideListSection(),
            CustomButtonWidget(
              backgroundColor: AppColors.buttonGuide,
              text: 'Все гиды',
              onPressed: () {
                context.router.push(
                  UsersRoute(
                    user: UsersEntity(email: '', gender: '', picture: ''),
                  ),
                );
              },
            ),
            SizedBox(height: AppSizes.paddingButton),
            CardReviews(),
            SizedBox(height: AppSizes.paddingLarge),
            SizedBox(height: AppSizes.paddingButton),
            AllReviews(reviews: reviews),
            SizedBox(height: AppSizes.paddingLarge),
            ContactForm(),
            SizedBox(height: AppSizes.paddingButton),
            Divider(),
            SotialLinksWidget(),
          ],
        ),
      ),
    );
  }
}
