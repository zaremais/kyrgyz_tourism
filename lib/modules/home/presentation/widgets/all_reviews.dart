// import 'package:flutter/material.dart';
// import 'package:kyrgyz_tourism/modules/home/data/models/review_model.dart';
// import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/reviews_widget.dart';

// class AllReviews extends StatelessWidget {
//   final List<ReviewModel> reviews;

//   const AllReviews({super.key, required this.reviews});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 35, right: 32),
//       child: Column(
//         children:
//             reviews
//                 .map(
//                   (review) => Padding(
//                     padding: const EdgeInsets.only(bottom: 24),
//                     child: ReviewsWidget(name: review.name, text: review.text),
//                   ),
//                 )
//                 .toList(),
//       ),
//     );
//   }
// }
