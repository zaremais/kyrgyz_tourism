import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kyrgyz_tourism/modules/reviews/domain/entities/reviews_entity.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewsEntity reviews;

  const ReviewsCard({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
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
                          : AssetImage('assets/images/ellipse1.png')
                              as ImageProvider,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviews.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 16,
                            color:
                                index < reviews.rating
                                    ? Colors.amber
                                    : Colors.grey[300],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(reviews.comment, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            // Text(
            //   _formatDate(reviews.createdAt),
            //   style: TextStyle(fontSize: 12, color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}
