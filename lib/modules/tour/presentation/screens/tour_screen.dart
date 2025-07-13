import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_list_section.dart';

import '../../../../core/config/themes/app_sizes.dart';

@RoutePage()
class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(height: 80, onPressed: () {}),

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
                  ],
                ),
              ),
              ToursListSection(),

              SizedBox(height: AppSizes.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
