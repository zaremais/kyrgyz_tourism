import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';

import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/features/guides/presentation/cubit/guide_cubit.dart';
import 'package:kyrgyz_tourism/features/guides/presentation/widgets/guide_card.dart';

class GuideSection extends StatelessWidget {
  GuideSection({super.key});

  final _guideCubit = di<GuideCubit>()..getGuides();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _guideCubit,
      child: BlocBuilder<GuideCubit, BaseState<List<GuideEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == StateStatus.success &&
              state.model != null) {
            final guides = state.model!;

            return Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: guides.length,
                itemBuilder: (context, index) {
                  final guide = guides[index];
                  return GuideCard(key: ValueKey(guide.id), guide: guide);
                },
              ),
            );
          }
          if (state.status == StateStatus.failure) {
            return Text('Ошибка: ${state.errorMessage}');
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
