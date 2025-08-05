import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

class TourCard extends StatelessWidget {
  final TourEntity tour;
  final VoidCallback? onTap;

  const TourCard({super.key, required this.tour, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                tour.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => const SizedBox(
                      height: 180,
                      child: Center(child: Icon(Icons.broken_image)),
                    ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tour.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Цена: ${tour.price} KGS'),
                  Text('Регион: ${tour.region}'),
                  if (tour.departureDates.isNotEmpty)
                    Text('Дата выезда: ${tour.departureDates.first}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
