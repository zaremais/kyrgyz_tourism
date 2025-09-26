import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/di/service_locator.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:kyrgyz_tourism/features/reviews/presentation/widgets/reviews_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ReviewsCubit>()..getReviews(),
      child: const ReviewsContent(),
    );
  }
}

class ReviewsContent extends StatelessWidget {
  const ReviewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, BaseState<List<ReviewsEntity>>>(
      builder: (context, state) {
        if (state.status == StateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == StateStatus.success && state.model != null) {
          final reviews = state.model!;

          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ReviewsCard(key: ValueKey(review.id), reviews: review);
              },
            ),
          );
        }
        if (state.status == StateStatus.failure) {
          return Text('Ошибка: ${state.errorMessage}');
        }
        return const SizedBox.shrink();
      },
    );
  }
}
