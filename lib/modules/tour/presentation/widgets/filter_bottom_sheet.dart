import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/region_selection_screen.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/check_box_widget.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool oneDay = false;
  bool longTerm = false;
  bool guideIncluded = false;
  bool withAccommodation = false;
  bool withFood = false;
  bool smallGroup = false;
  bool bigGroup = false;
  String? selectedDifficulty;
  String? selectedRegion;

  void _onRegionSelected(String region) {
    setState(() {
      selectedRegion = region.isEmpty ? null : region;
    });
    _filterTourCubit.filterTour(
      FilterTourParams(
        oneDay: false,
        longTerm: false,
        guideIncluded: false,
        withAccommodation: false,
        withFood: false,
        smallGroup: false,
        bigGroup: false,
        difficulty: 'EASY',
        region: region,
      ),
    );
  }

  void _openRegionSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
              value: _filterTourCubit,
              child: RegionSelectionScreen(
                selectedRegion: selectedRegion,
                onRegionSelected: _onRegionSelected,
              ),
            ),
      ),
    );
  }

  final _filterTourCubit = di<TourCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 80),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.text),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10),
          child: BlocProvider.value(
            value: _filterTourCubit,

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),

                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: _openRegionSelection,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            selectedRegion ?? S.of(context).selectedRegion,

                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.arrow_forward_ios, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CheckBoxWidget(
                    title: S.of(context).oneDay,
                    value: oneDay,
                    onChanged: (v) {
                      setState(() {
                        oneDay = v;
                      });
                    },
                  ),
                  CheckBoxWidget(
                    title: S.of(context).longTerm,
                    value: longTerm,
                    onChanged: (v) {
                      setState(() {
                        longTerm = v;
                      });
                    },
                  ),

                  CheckBoxWidget(
                    title: 'Гид',
                    value: guideIncluded,
                    onChanged: (v) {
                      setState(() {
                        guideIncluded = v;
                      });
                    },
                  ),
                  CheckBoxWidget(
                    title: 'С проживанием',
                    value: withAccommodation,
                    onChanged: (v) {
                      setState(() {
                        withAccommodation = v;
                      });
                    },
                  ),
                  CheckBoxWidget(
                    title: 'С питанием',
                    value: withFood,
                    onChanged: (v) {
                      setState(() {
                        withFood = v;
                      });
                    },
                  ),
                  CheckBoxWidget(
                    title: 'Большая группа',
                    value: bigGroup,
                    onChanged: (v) {
                      setState(() {
                        bigGroup = v;
                      });
                    },
                  ),
                  CheckBoxWidget(
                    title: 'Малая группа',
                    value: smallGroup,
                    onChanged: (v) {
                      setState(() {
                        smallGroup = v;
                      });
                    },
                  ),

                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: selectedDifficulty,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Сложность',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'EASY',
                        child: Text('Легкий тур'),
                      ),
                      DropdownMenuItem(
                        value: 'MEDIUM',
                        child: Text('Средней сложности'),
                      ),
                      DropdownMenuItem(
                        value: 'HARD',
                        child: Text('Сложный тур'),
                      ),
                    ],
                    onChanged: (v) => setState(() => selectedDifficulty = v),
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              height: 50,

                              child: ElevatedButton(
                                onPressed: () {
                                  _filterTourCubit.filterTour(
                                    FilterTourParams(
                                      oneDay: oneDay,
                                      longTerm: longTerm,
                                      guideIncluded: guideIncluded,
                                      withAccommodation: withAccommodation,
                                      withFood: withFood,
                                      smallGroup: smallGroup,
                                      bigGroup: bigGroup,
                                      difficulty:
                                          selectedDifficulty?.toUpperCase(),
                                      region: selectedRegion?.toUpperCase(),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonTour,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      16,
                                    ),
                                  ),
                                  minimumSize: const Size(140, 48),
                                ),
                                child: Text(S.of(context).apply),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              oneDay = false;
                              longTerm = false;
                              guideIncluded = false;
                              withAccommodation = false;
                              withFood = false;
                              smallGroup = false;
                              bigGroup = false;
                              selectedDifficulty = null;
                              selectedRegion = null;
                            });
                          },
                          child: const Text(
                            'Сбросить',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
