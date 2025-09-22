import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/widgets/filter_bottom_sheet.dart';
import 'package:kyrgyz_tourism/features/tour/presentation/widgets/tour_list_section.dart';
import '../../../../core/config/themes/app_sizes.dart';

@RoutePage()
class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 80,
          onPressed: () {
            context.router.replace(HomeRoute());
          },
        ),

        drawer: Drawer(child: Column(children: [CustomDrawer()])),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).tours,
                      style: TextStyle(
                        fontSize: AppSizes.bigFontSize,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: AppSizes.paddingHorizontal),
                    Text(S.of(context).alltours, style: FontStyles.bodyInfo),
                    SizedBox(height: AppSizes.paddingHorizontal),
                    GestureDetector(
                      onTap: () {
                        context.router.replace(IndividualToursRoute());
                      },
                      child: Text(
                        S.of(context).besttour,
                        style: FontStyles.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              S.of(context).filter,
                              style: FontStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (_) => const FilterBottomSheet(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              TourListSection(),

              SizedBox(height: AppSizes.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
