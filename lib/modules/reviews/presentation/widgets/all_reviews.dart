import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_card.dart';

class AllReviews extends StatefulWidget {
  const AllReviews({super.key});

  @override
  State<AllReviews> createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews> {
  final _reviewsCubit = di<ReviewsCubit>()..getReviews();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reviewsCubit,
      child: BlocBuilder<ReviewsCubit, BaseState<List<ReviewsEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return CircularProgressIndicator();
          }
          if (state.status == StateStatus.error) {
            return Center(child: Text('Ошибка: ${state.error}'));
          }
          if (state.status == StateStatus.success) {
            final reviews = state.model ?? [];
            if (reviews.isEmpty) {
              return const Center(child: Text('Пока нет отзывов'));
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (context, index) {
                return ReviewsCard(reviews: reviews[index]);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewsCard(reviews: reviews[index]);
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
