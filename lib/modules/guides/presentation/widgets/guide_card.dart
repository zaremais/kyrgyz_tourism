import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/modules/guides/domain/entities/guide_entity.dart';

class GuideCard extends StatelessWidget {
  final GuideEntity guide;

  const GuideCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:
                    guide.image != null
                        ? Image.network(guide.image!, width: 60)
                        : Icon(Icons.person),
              ),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guide.name ?? 'Гид',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${guide.rating}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 24,
                              color:
                                  index < guide.rating!.floor()
                                      ? AppColors.star
                                      : Colors.grey[300],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${guide.reviews} Отзыва',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${guide.experience} лет опыта',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(guide.description.toString()),
        ],
      ),
    );
  }
}
