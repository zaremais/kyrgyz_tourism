import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/list_tour_widget.dart';

class ToursListSection extends StatefulWidget {
  const ToursListSection({super.key});

  @override
  State<ToursListSection> createState() => _ToursListSectionState();
}

class _ToursListSectionState extends State<ToursListSection> {
  late final TourCubit _tourCubit;

  @override
  void initState() {
    super.initState();
    _tourCubit = di<TourCubit>()..getTours();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tourCubit,
      child: BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
        builder: (context, state) {
          print('STATE: ${state.status}, TOURS: ${state.model?.length}');
          switch (state.status) {
            case StateStatus.success:
              final tours = state.model ?? [];
              if (tours.isEmpty) {
                return const Center(
                  child: Text(
                    "Нет доступных туров",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  print('BUILD TOUR ITEM: ${tours[index].title}');
                  return ListTourWidget(tour: tours[index]);
                },
              );

            case StateStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case StateStatus.error:
              return const Center(
                child: Text(
                  "Произошла ошибка при загрузке туров",
                  style: TextStyle(color: Colors.red),
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _tourCubit.close();
    super.dispose();
  }
}
