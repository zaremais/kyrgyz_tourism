import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';
import 'package:kyrgyz_tourism/modules/home/data/models/review_model.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/all_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/card_reviews.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/social_links_widget.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/list_tour_widget.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_calendar.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_details_tile.dart';

@RoutePage()
class TourDetailsScreen extends StatefulWidget {
  const TourDetailsScreen({super.key, required this.tour});

  final TourEntity tour;

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {
  final ValueNotifier<bool> isFavorite = ValueNotifier(false);

  @override
  void dispose() {
    isFavorite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text("Туры"), centerTitle: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSizes.paddingLarge),
            ListTourWidget(tour: widget.tour),

            const Center(
              child: Text(
                "Ближайшие даты выездов",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: AppSizes.paddingSmall),
            TourCalendar(),

            SizedBox(height: AppSizes.paddingLarge),

            // CustomButtonWidget(
            //   text: "Забронировать",
            //   backgroundColor: AppColors.buttonGuide,
            //   onPressed: () {
            //     context.router.push(IsBookedRoute());
            //   },
            // ),
            // const SizedBox(height: AppSizes.paddingBottom),
            Padding(
              padding: EdgeInsets.all(AppSizes.paddingLarge),
              child: Column(
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                      if (index < 2) SizedBox(height: AppSizes.paddingLarge),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: AppSizes.paddingBig),

            _buildTourDetails(widget.tour, context),
            const SizedBox(height: AppSizes.paddingBig),

            CardReviews(),
            const SizedBox(height: AppSizes.paddingBig),
            AllReviews(reviews: reviews),
            SizedBox(height: AppSizes.paddingButtonHeight),
            Divider(),
            SotialLinksWidget(),
          ],
        ),
      ),
    );
  }
}

// Widget _buildDetailTile({
//   required String iconPath,
//   required String title,
//   required String subtitle,
// }) {
//   return ListTile(
//     leading: Image.asset(iconPath),
//     title: Text(title, style: FontStyles.bodyInfo),
//     subtitle: Text(subtitle, style: FontStyles.bodyLarge),
//   );
// }

Widget _buildTourDetails(TourEntity tour, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TourDetailTile(
        iconPath: 'assets/icon/location.png',
        title: 'Точка сбора',
        subtitle: tour.location ?? "",
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/calendar.png',
        title: 'Длительность',
        subtitle: tour.tourDuration.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/hiking.png',
        title: 'Сложность',
        subtitle: tour.category ?? '',
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/price.png',
        title: 'Стоимость',
        subtitle: tour.price.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/human.png',
        title: 'Возраст от',
        subtitle: tour.age.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/group.png',
        title: 'Группа',
        subtitle: tour.groupPeople.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
    ],
  );
}
