import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_card.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final _reviewsCubit = di<ReviewsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reviewsCubit,
      child: BlocBuilder<ReviewsCubit, BaseState<List<ReviewsEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == StateStatus.failure) {
            return Center(child: Text(S.of(context).stateerror));
          }
          if (state.status == StateStatus.success) {
            final reviews = state.model ?? [];

            return SizedBox(
              // margin: EdgeInsets.symmetric(vertical: 24),
              // padding: EdgeInsets.all(16),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];

                  return ReviewsCard(reviews: review);
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
