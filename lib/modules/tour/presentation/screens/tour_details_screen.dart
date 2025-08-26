import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/home/presentation/widgets/social_links_widget.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_card.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,

          title: Text(S.of(context).tours),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSizes.paddingLarge),
              Padding(
                padding: const EdgeInsets.all(.0),
                child: TourCard(tour: widget.tour),
              ),
              SizedBox(height: AppSizes.bigFontSize),

              const Center(
                child: Text(
                  "Ближайшие даты выездов",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // TourCalendar(),
              Padding(
                padding: EdgeInsets.only(left: AppSizes.paddingLarge),
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

              const SizedBox(height: AppSizes.paddingBig),
              // AllReviews(),
              SizedBox(height: AppSizes.paddingButtonHeight),
              Divider(),
              SotialLinksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTourDetails(TourEntity tour, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TourDetailTile(
        iconPath: 'assets/icon/location.png',
        title: 'Точка сбора',
        subtitle: tour.region,
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
        subtitle: tour.difficulty.toString(),
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
        subtitle: tour.minAge.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
      TourDetailTile(
        iconPath: 'assets/icon/group.png',
        title: 'Группа',
        subtitle: tour.groupSize.toString(),
        color: isDark ? Colors.white : Colors.black,
      ),
    ],
  );
}
