import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/tour_cubit.dart';

class GuideListSection extends StatefulWidget {
  const GuideListSection({super.key});

  @override
  State<GuideListSection> createState() => _GuideListSectionState();
}

class _GuideListSectionState extends State<GuideListSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, BaseState<List<TourEntity>>>(
      builder: (context, state) {
        final guides = state.model ?? [];
        if (guides.isEmpty) {
          return Text('Нет доступных гидов');
        }
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: guides.length,
            itemBuilder: (context, index) {
              final tour = guides[index];
              // final guide = tour.guide;
              // return ListGuideCard(guide: guide, tour: tour);
            },
          ),
        );
      },
    );
  }
}
