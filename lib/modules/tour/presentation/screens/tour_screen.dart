import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_app_bar.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_drawer.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/filter_tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/filter_bottom_sheet.dart';

import '../../../../core/config/themes/app_sizes.dart';

@RoutePage()
class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
  final ValueNotifier<FilterTourEntity?> currentFilter = ValueNotifier(null);

  // List<TourEntity> _applyFilterToTours(
  //   List<TourEntity> tours,
  //   FilterTourEntity? filter,
  // ) {
  //   if (filter == null) return tours;

  //   return tours.where((tour) {
  //     if (filter.oneDay && !tour.oneDay!) return false;
  //     if (filter.longTerm && !tour.longTerm!) return false;
  //     if (filter.guideIncluded && !tour.guideIncluded!) return false;
  //     if (filter.withAccommodation && !tour.withAccommodation!) return false;
  //     if (filter.withFood && !tour.withFood!) return false;
  //     if (filter.smallGroup && !tour.smallGroup!) return false;
  //     if (filter.bigGroup && !tour.bigGroup!) return false;
  //     if (filter.difficulty != null &&
  //         tour.difficulty != filter.difficulty!.name)
  //       return false;
  //     if (filter.region.isNotEmpty && tour.region != filter.region)
  //       return false;
  //     return true;
  //   }).toList();
  // }

  final _tourCubit = di<TourCubit>()..getTours();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: _tourCubit,

        child: Scaffold(
          appBar: CustomAppBar(
            height: 80,
            onPressed: () {
              context.router.push(GuideRoute());
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
                          // context.router.replace(BestTourRouter());
                        },
                        child: Text(
                          S.of(context).besttour,
                          style: FontStyles.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          context.router.push(IndividualToursRoute());
                        },
                        child: Text(
                          S.of(context).individualtours,
                          style: FontStyles.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.black, thickness: 2),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useRootNavigator: false,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),

                              builder:
                                  (_) => FilterBottomSheet(
                                    currentFilter: currentFilter.value,
                                    onApply: (newFilter) {
                                      currentFilter.value = newFilter;
                                      Navigator.pop(context);

                                      print('Применён фильтр: $newFilter');
                                    },
                                  ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Фильтрация",
                                style: FontStyles.bodyMedium.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(Icons.expand_more),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                // BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
                //   builder: (context, state) {
                //     if (state.status == StateStatus.loading) {
                //       return const Center(child: CircularProgressIndicator());
                //     }
                //     // final tours = state.model ?? [];

                //     // return ValueListenableBuilder<FilterTourEntity?>(
                //     //   valueListenable: currentFilter,
                //     //   // builder: (_, filter, __) {
                //     //   //   final filteredTours = _applyFilterToTours(
                //     //   //     tours,
                //     //   //     filter,
                //     //   //   );
                //     //   //   return ToursListSection(tours: filteredTours);
                //     //   // },
                //     // );
                //   }
                // ),
                SizedBox(height: AppSizes.paddingLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
