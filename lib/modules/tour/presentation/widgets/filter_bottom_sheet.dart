import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

class FilterBottomSheet extends StatefulWidget {
  final void Function(TourEntity filter) onApply;

  const FilterBottomSheet({
    super.key,
    required this.onApply,
    TourEntity? currentFilter,
  });

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
  bool difficulty = false;
  String selectedRegion = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 600,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              _buildFilterOption(
                "Регион",
                onTap: () {
                  context.router.push(
                    RegionSelectionRoute(
                      selectedRegion: selectedRegion,
                      onRegionSelected: (value) {
                        selectedRegion = value;
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),
              _buildCheck(
                "Однодневный",
                oneDay,
                (v) => setState(() => oneDay = v),
              ),
              _buildCheck(
                "Длительный",
                longTerm,
                (v) => setState(() => longTerm = v),
              ),
              _buildCheck(
                "Гид",
                guideIncluded,
                (v) => setState(() => guideIncluded = v),
              ),
              _buildCheck(
                "С проживанием",
                withAccommodation,
                (v) => setState(() => withAccommodation = v),
              ),
              _buildCheck(
                "С питанием",
                withFood,
                (v) => setState(() => withFood = v),
              ),
              _buildCheck(
                "Большая группа",
                bigGroup,
                (v) => setState(() => bigGroup = v),
              ),
              _buildCheck(
                "Малая группа",
                smallGroup,
                (v) => setState(() => smallGroup = v),
              ),
              _buildCheck(
                "Легкий тур",
                difficulty,
                (v) => setState(() => difficulty = v),
              ),
              _buildCheck(
                "Средней сложности",
                difficulty,
                (v) => setState(() => difficulty = v),
              ),
              _buildCheck(
                "Сложный тур",
                difficulty,
                (v) => setState(() => difficulty = v),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // widget.onApply(
                  // FilterTourEntity(
                  //   oneDay: oneDay,
                  //   longTerm: longTerm,
                  //   guideIncluded: guideIncluded,
                  //   withAccommodation: withAccommodation,
                  //   withFood: withFood,
                  //   smallGroup: smallGroup,
                  //   bigGroup: bigGroup,
                  //   // difficulty: difficulty,
                  //   region: selectedRegion,
                  // ),
                  // );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonTour,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Применить"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    oneDay =
                        longTerm =
                            guideIncluded =
                                withAccommodation =
                                    withFood =
                                        smallGroup =
                                            bigGroup = difficulty = false;
                    selectedRegion = '';
                  });
                },
                child: const Text(
                  "Сбросить",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheck(String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 1, offset: Offset(1, 1)),
        ],
      ),
      child: CheckboxListTile(
        side: BorderSide(color: Colors.grey.shade700),
        checkColor: Colors.grey,
        fillColor: WidgetStatePropertyAll(Colors.white),
        value: value,
        onChanged: (v) => onChanged(v!),
        title: Text(title),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _buildFilterOption(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(width: 20),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
