import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/cubit/guide_cubit.dart';
import 'package:kyrgyz_tourism/modules/guides/presentation/widgets/guide_card.dart';

class GuideSection extends StatefulWidget {
  const GuideSection({super.key});

  @override
  State<GuideSection> createState() => _GuideSectionState();
}

class _GuideSectionState extends State<GuideSection> {
  final _guideCubit = di<GuideCubit>()..getGuides();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _guideCubit,
      child: BlocBuilder<GuideCubit, BaseState<List<GuideEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == StateStatus.error) {
            return Center(child: Text(S.of(context).stateerror));
          }
          if (state.status == StateStatus.success) {
            final guides = state.model ?? [];

            return Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: guides.length,
                itemBuilder: (context, index) {
                  final guide = guides[index];

                  return GuideCard(guide: guide);
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
