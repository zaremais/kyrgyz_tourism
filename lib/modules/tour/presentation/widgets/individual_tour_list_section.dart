import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/list_tour_widget.dart';

class IndividualTourListSection extends StatefulWidget {
  const IndividualTourListSection({super.key});

  @override
  State<IndividualTourListSection> createState() =>
      _IndividualTourListSectionState();
}

class _IndividualTourListSectionState extends State<IndividualTourListSection> {
  final _tourCubit = di<TourCubit>()..getIndividualTour();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tourCubit,
      child: BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const CircularProgressIndicator();
          }
          if (state.status == StateStatus.error) {
            if (state.status == StateStatus.error) {
              return const Center(
                child: Text(
                  "Ошибка загрузки туров",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
          }
          if (state.status == StateStatus.success) {
            final tours = state.model ?? [];

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tours.length,
              itemBuilder: (context, index) {
                return ListTourWidget(tour: tours[index]);
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
