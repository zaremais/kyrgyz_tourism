import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewsEntity reviews;

  const ReviewsCard({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage:
                      reviews.imageUrl != null
                          ? NetworkImage(reviews.imageUrl!)
                          : const AssetImage('assets/images/ellipse1.png')
                              as ImageProvider,
                ),
              ],
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviews.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 16,
                        color:
                            index < reviews.rating.floor()
                                ? Colors.amber
                                : Colors.grey[300],
                      );
                    }),
                    SizedBox(width: 8),
                    Text(
                      'Рейтинг: ${reviews.rating}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(reviews.comment, style: const TextStyle(fontSize: 14)),
            Text(
              '2 дня назад',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
