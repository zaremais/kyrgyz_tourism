import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewsEntity reviews;

  const ReviewsCard({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 24,
          //       backgroundImage:
          //           reviews.imageUrl != null
          //               ? NetworkImage(reviews.imageUrl!)
          //               : const AssetImage('assets/images/ellipse1.png')
          //                   as ImageProvider,
          //     ),
          //   ],
          // ),
          // SizedBox(width: 12),
          Column(
            children: [
              Center(
                child: Text(
                  reviews.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    return Center(
                      child: Icon(
                        Icons.star,
                        size: 16,
                        color:
                            index < reviews.rating.floor()
                                ? Colors.amber
                                : Colors.grey[300],
                      ),
                    );
                  }),

                  // SizedBox(width: 8),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(reviews.comment, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
