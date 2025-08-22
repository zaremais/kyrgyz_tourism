import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/usecases/add_reviews_use_case.dart';
import 'package:kyrgyz_tourism/modules/reviews/presentation/cubit/reviews_cubit.dart';

@RoutePage()
class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();

  final _commentController = TextEditingController();

  double _rating = 0.1;

  final _reviewsCubit = di<ReviewsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить отзыв')),
      body: BlocProvider.value(
        value: _reviewsCubit,
        child: BlocConsumer<ReviewsCubit, BaseState<void>>(
          listener: (context, state) {
            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ошибка: ${state.errorMessage}'),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
            if (state.status == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Отзыв успешно добавлен')),
              );
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        labelText: 'Комментарий',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите комментарий';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        const Text('Рейтинг:'),
                        const SizedBox(width: 8),

                        RatingBar.builder(
                          initialRating: _rating,
                          minRating: 0.1,
                          maxRating: 5.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14,
                          itemBuilder:
                              (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonForm,
                        minimumSize: Size(330, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                      onPressed:
                          state.status == StateStatus.loading
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  _reviewsCubit.addReviews(
                                    params: AddReviewsParams(
                                      comment: _commentController.text,
                                      rating: _rating,
                                    ),
                                  );
                                }
                              },
                      child:
                          state.status == StateStatus.loading
                              ? const CircularProgressIndicator()
                              : const Text(
                                'Отправить отзыв',
                                style: TextStyle(fontSize: 18),
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddReview(context),
        child: Icon(Icons.add_comment),
      ),
    );
  }

  void _navigateToAddReview(BuildContext context) {
    context.router.push(AddReviewRoute());
  }
}
