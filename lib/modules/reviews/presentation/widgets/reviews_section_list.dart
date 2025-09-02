import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_card.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final _reviewsCubit = di<ReviewsCubit>()..getReviews(NoParams());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reviewsCubit,
      child: BlocBuilder<ReviewsCubit, BaseState<List<ReviewsEntity>>>(
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
                  final reviews = guides[index];

                  return ReviewsCard(reviews: reviews);
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
