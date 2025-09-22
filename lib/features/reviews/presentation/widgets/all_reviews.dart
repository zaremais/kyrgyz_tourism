// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kyrgyz_tourism/core/base/base_state.dart';
// import 'package:kyrgyz_tourism/core/config/route/route.dart';
// import 'package:kyrgyz_tourism/core/di/init_di.dart';
// import 'package:kyrgyz_tourism/core/enums/state_status.dart';
// import 'package:kyrgyz_tourism/generated/l10n.dart';
// import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';
// import 'package:kyrgyz_tourism/modules/reviews/presentation/cubit/reviews_cubit.dart';
// import 'package:kyrgyz_tourism/modules/reviews/presentation/widgets/reviews_card.dart';

// // @RoutePage()
// class AllReviews extends StatefulWidget {
//   const AllReviews({super.key});

//   @override
//   State<AllReviews> createState() => _AllReviewsState();
// }

// class _AllReviewsState extends State<AllReviews> {
//   final _reviewsCubit = di<ReviewsCubit>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(S.of(context).reviews)),
//       body: BlocProvider.value(
//         value: _reviewsCubit,
//         child: BlocBuilder<ReviewsCubit, BaseState<List<ReviewsEntity>>>(
//           builder: (context, state) {
//             if (state.status == StateStatus.loading) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (state.status == StateStatus.failure) {
//               return Center(child: Text('Ошибка: ${state.errorMessage}'));
//             }
//             if (state.status == StateStatus.success) {
//               final reviews = state.model ?? [];
//               if (reviews.isEmpty) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Пока нет отзывов'),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () => _navigateToAddReview(context),
//                         child: Text('Оставить первый отзыв'),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               return ListView.builder(
//                 padding: EdgeInsets.all(16),
//                 itemCount: reviews.length,
//                 itemBuilder: (context, index) {
//                   return ReviewsCard(reviews: reviews[index]);
//                 },
//               );
//             }
//             return SizedBox.shrink();
//           },
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () => _navigateToAddReview(context),
//       //   child: Icon(Icons.add_comment),
//       // ),
//     );
//   }

//   void _navigateToAddReview(BuildContext context) {
//     context.router.push(AddReviewRoute());
//   }
// }
