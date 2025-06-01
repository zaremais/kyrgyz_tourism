// import 'package:flutter/material.dart';
// import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
// import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

// class ListGuideCard extends StatelessWidget {
//   final GuideEntity? guide;
//   final TourEntity? tour;

//   const ListGuideCard({super.key, required this.guide, required this.tour});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Image.asset(tour!.guide.imageGuide ?? '', width: 100),

//             SizedBox(width: 41),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   tour!.guide.name ?? '',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Text(tour!.guide.rating.toString()),
//                     Image.asset('assets/images/star.png', width: 24),
//                   ],
//                 ),
//                 Text(tour!.guide!.reviews.toString()),
//                 Text(tour!.guide!.experience.toString()),
//                 SizedBox(height: AppSizes.paddingLarge),
//               ],
//             ),
//           ],
//         ),
//         Text(tour!.guide.description ?? ''),

//         SizedBox(height: 30),
//       ],
//     );
//   }
// }
