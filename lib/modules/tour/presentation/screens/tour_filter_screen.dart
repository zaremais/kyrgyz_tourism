import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/usecases/filter_tours_use_case.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/filter_tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/screens/region_selection_screen.dart';

@RoutePage()
class TourFilterScreen extends StatefulWidget {
  const TourFilterScreen({super.key});

  @override
  _TourFilterScreenState createState() => _TourFilterScreenState();
}

class _TourFilterScreenState extends State<TourFilterScreen> {
  String? selectedRegion;
  late final FilterTourCubit _filterTourCubit;

  @override
  void initState() {
    super.initState();
    _filterTourCubit = di<FilterTourCubit>();
    _loadInitialTours();
  }

  void _loadInitialTours() {
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
        region: '', // без фильтра
      ),
    );
  }

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

  final _regionFilterCubit = di<FilterTourCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Туры')),
      body: BlocProvider.value(
        value: _regionFilterCubit,

        child: Column(
          children: [
            ElevatedButton(
              onPressed: _openRegionSelection,
              child: Text(selectedRegion ?? 'Выбрать регион'),
            ),
            Expanded(
              child: BlocBuilder<FilterTourCubit, BaseState<List<TourEntity>>>(
                builder: (context, state) {
                  if (state.status == StateStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.status == StateStatus.failure) {
                    return Center(child: Text(state.errorMessage ?? 'Ошибка'));
                  }
                  final tours = state.model ?? [];
                  if (tours.isEmpty) {
                    return const Center(child: Text('Туры не найдены'));
                  }
                  return ListView.builder(
                    itemCount: tours.length,
                    itemBuilder: (context, index) {
                      final tour = tours[index];
                      return ListTile(
                        title: Text(tour.title),
                        subtitle: Text('Регион: ${tour.region}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
