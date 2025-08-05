import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_list_section.dart';

import '../../../../core/config/themes/app_sizes.dart';

// @RoutePage()
// class ToursScreen extends StatefulWidget {
//   const ToursScreen({super.key});

//   @override
//   State<ToursScreen> createState() => _ToursScreenState();
// }

// class _ToursScreenState extends State<ToursScreen> {
//   final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
//   final ValueNotifier<FilterTourEntity?> currentFilter = ValueNotifier(null);

//   // List<TourEntity> _applyFilterToTours(
//   //   List<TourEntity> tours,
//   //   FilterTourEntity? filter,
//   // ) {
//   //   if (filter == null) return tours;

//   //   return tours.where((tour) {
//   //     if (filter.oneDay && !tour.oneDay!) return false;
//   //     if (filter.longTerm && !tour.longTerm!) return false;
//   //     if (filter.guideIncluded && !tour.guideIncluded!) return false;
//   //     if (filter.withAccommodation && !tour.withAccommodation!) return false;
//   //     if (filter.withFood && !tour.withFood!) return false;
//   //     if (filter.smallGroup && !tour.smallGroup!) return false;
//   //     if (filter.bigGroup && !tour.bigGroup!) return false;
//   //     if (filter.difficulty != null &&
//   //         tour.difficulty != filter.difficulty!.name)
//   //       return false;
//   //     if (filter.region.isNotEmpty && tour.region != filter.region)
//   //       return false;
//   //     return true;
//   //   }).toList();
//   // }

//   final _tourCubit = di<TourCubit>()..getTours();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocProvider.value(
//         value: _tourCubit,

//         child: Scaffold(
//           appBar: CustomAppBar(
//             height: 80,
//             onPressed: () {
//               context.router.push(GuideRoute());
//             },
//           ),

//           drawer: Drawer(child: Column(children: [CustomDrawer()])),

//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 24,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         S.of(context).tours,
//                         style: TextStyle(
//                           fontSize: AppSizes.bigFontSize,
//                           fontWeight: FontWeight.w600,
//                           decoration: TextDecoration.underline,
//                           decorationColor: AppColors.grey,
//                         ),
//                       ),
//                       SizedBox(height: AppSizes.paddingHorizontal),
//                       Text(S.of(context).alltours, style: FontStyles.bodyInfo),
//                       SizedBox(height: AppSizes.paddingHorizontal),
//                       GestureDetector(
//                         onTap: () {
//                           // context.router.replace(BestTourRouter());
//                         },
//                         child: Text(
//                           S.of(context).besttour,
//                           style: FontStyles.bodyMedium,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       GestureDetector(
//                         onTap: () {
//                           context.router.push(IndividualToursRoute());
//                         },
//                         child: Text(
//                           S.of(context).individualtours,
//                           style: FontStyles.bodyMedium,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Divider(color: Colors.black, thickness: 2),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: GestureDetector(
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               useRootNavigator: false,
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(20),
//                                 ),
//                               ),

//                               builder:
//                                   (_) => FilterBottomSheet(
//                                     currentFilter: currentFilter.value,
//                                     onApply: (newFilter) {
//                                       currentFilter.value = newFilter;
//                                       Navigator.pop(context);

//                                       print('Применён фильтр: $newFilter');
//                                     },
//                                   ),
//                             );
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Фильтрация",
//                                 style: FontStyles.bodyMedium.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const Icon(Icons.expand_more),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),

//                 // BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
//                 //   builder: (context, state) {
//                 //     if (state.status == StateStatus.loading) {
//                 //       return const Center(child: CircularProgressIndicator());
//                 //     }
//                 //     // final tours = state.model ?? [];

//                 //     // return ValueListenableBuilder<FilterTourEntity?>(
//                 //     //   valueListenable: currentFilter,
//                 //     //   // builder: (_, filter, __) {
//                 //     //   //   final filteredTours = _applyFilterToTours(
//                 //     //   //     tours,
//                 //     //   //     filter,
//                 //     //   //   );
//                 //     //   //   return ToursListSection(tours: filteredTours);
//                 //     //   // },
//                 //     // );
//                 //   }
//                 // ),
//                 SizedBox(height: AppSizes.paddingLarge),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

@RoutePage()
class ToursScreen extends StatefulWidget {
  // final TourEntity tour;
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  final ValueNotifier<TourFilter> selectedType = ValueNotifier(TourFilter.best);
  final ValueNotifier<FilterTourEntity?> currentFilter = ValueNotifier(null);
  final Map<String, bool> filters = {
    'oneDay': false,
    'longTerm': false,
    'guideIncluded': false,
    'withAccommodation': false,
    'withFood': false,
    'bigGroup': false,
    'smallGroup': false,
  };

  String? selectedRegion;
  final _tourCubit = di<TourCubit>()..getTours;

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(Icons.horizontal_rule_rounded, size: 40),
                  ),
                  const Text(
                    'Фильтрация',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () async {
                      final region = await context.router.push(
                        RegionSelectionRoute(
                          selectedRegion: selectedRegion,
                          onRegionSelected: (region) {
                            setModalState(() => selectedRegion = region);
                            Navigator.pop(context);
                          },
                        ),
                      );
                      if (region != null) {
                        setModalState(() => selectedRegion);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedRegion ?? 'Выберите регион',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Фильтры
                  _buildFilterCheckbox('oneDay', 'Однодневный', setModalState),
                  _buildFilterCheckbox('longTerm', 'Длительный', setModalState),
                  _buildFilterCheckbox('guideIncluded', 'Гид', setModalState),
                  _buildFilterCheckbox(
                    'withAccommodation',
                    'С проживанием',
                    setModalState,
                  ),
                  _buildFilterCheckbox('withFood', 'С питанием', setModalState),
                  _buildFilterCheckbox(
                    'bigGroup',
                    'Большая группа',
                    setModalState,
                  ),
                  _buildFilterCheckbox(
                    'smallGroup',
                    'Малая группа',
                    setModalState,
                  ),

                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setModalState(() {
                            filters.forEach((key, value) => false);
                            selectedRegion = null;
                          });
                        },
                        child: const Text('Сбросить'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                          _tourCubit.getTours();
                        },
                        child: const Text('Применить'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterCheckbox(
    String key,
    String title,
    StateSetter setModalState,
  ) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: filters[key],
      onChanged: (value) {
        setModalState(() => filters[key] = value ?? false);
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 80,
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.filter_list),
          //     onPressed: _showFilterBottomSheet,
          //   ),
          // ],
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
                      "Туры",
                      style: TextStyle(
                        fontSize: AppSizes.bigFontSize,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: AppSizes.paddingHorizontal),
                    GestureDetector(
                      onTap: () {
                        // context.router.push(ToursRoute());
                      },
                      child: Text("Все туры", style: FontStyles.bodyInfo),
                    ),
                    SizedBox(height: AppSizes.paddingHorizontal),
                    Text("Лучшие туры", style: FontStyles.bodyMedium),
                    SizedBox(height: AppSizes.paddingHorizontal),
                    GestureDetector(
                      onTap: () {
                        context.router.push(IndividualToursRoute());
                      },
                      child: Text(
                        S.of(context).individualtours,
                        style: FontStyles.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(height: 2, color: Colors.black26),
                    SizedBox(height: 5),

                    GestureDetector(
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              TourListSection(),
            ],
          ),
        ),
      ),

      // TourListSection(tour: TourEntity(id: id, title: title, author: author, price: price, tourDuration: tourDuration, rating: rating, placesLeft: placesLeft, region: region, image: image, departureDates: departureDates),

      // ),
      // SizedBox(height: AppSizes.paddingLarge),
    );
  }
}




  



    //  Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 24),
    //                     child: GestureDetector(
    //                       onTap: () {
    //                         showModalBottomSheet(
    //                           context: context,
    //                           isScrollControlled: true,
    //                           useRootNavigator: false,
    //                           shape: const RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.vertical(
    //                               top: Radius.circular(20),
    //                             ),
    //                           ),

    //                           builder:
    //                               (_) => FilterBottomSheet(
    //                                 currentFilter: currentFilter.value,
    //                                 onApply: (newFilter) {
    //                                   currentFilter.value = newFilter;
    //                                   Navigator.pop(context);

    //                                   print('Применён фильтр: $newFilter');
    //                                 },
    //                               ),
    //                         );
    //                       },
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "Фильтрация",
    //                             style: FontStyles.bodyMedium.copyWith(
    //                               fontWeight: FontWeight.w500,
    //                             ),
    //                           ),
    //                           const Icon(Icons.expand_more),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 10),
    //                 ],
    //               ),
    //             ),