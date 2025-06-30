import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';

class GuideCard extends StatelessWidget {
  final GuideEntity guide;

  const GuideCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(guide.image, width: 122),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rating:${guide.experience}'),
                        Text('Reviews: ${guide.reviews}'),
                        Row(
                          children: [
                            Text('Рейтинг: ${guide.rating}'),
                            const SizedBox(width: 24),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(guide.description),
          ],
        ),
      ),
    );
  }
}
