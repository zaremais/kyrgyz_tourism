import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/list_tour_widget.dart';
// ignore: unused_import
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/tour_card.dart';

class TourListSection extends StatefulWidget {
  const TourListSection({super.key});

  @override
  State<TourListSection> createState() => _TourListSectionState();
}

class _TourListSectionState extends State<TourListSection> {
  final _tourCubit = di<TourCubit>()..getTours();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tourCubit,
      child: BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == StateStatus.failure) {
            return const Center(
              child: Text(
                "Нет доступных туров",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (state.status == StateStatus.success) {
            final tours = state.model ?? [];

            if (tours.isEmpty) {
              return const Center(child: Text("Нет доступных туров"));
            }

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
