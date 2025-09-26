import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/utils/data_formatter.dart';
import 'package:kyrgyz_tourism/features/tour/domain/entities/tour_entity.dart';

class TourCard extends StatelessWidget {
  final TourEntity tour;
  final VoidCallback? onTap;

  const TourCard({super.key, required this.tour, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(34.0),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(
              tour.image.toString(),
              fit: BoxFit.cover,
              width: 330,
              height: 330,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      tour.title ?? 'Без названия',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        tour.rating.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Image.asset('assets/images/star.png', width: 24),
                    ],
                  ),
                ],
              ),
              Text(
                '${tour.tourDuration} дня',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '${tour.price} сом',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Text(
                'Дата выезда: ${_formatDepartureDate(tour.departureDates)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'Осталось мест: ${tour.placesLeft}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDepartureDate(dynamic departureDates) {
    try {
      if (departureDates == null) return 'Не указана';

      final dateString = departureDates.toString();
      if (dateString.isEmpty) return 'Не указана';

      final date = DateTime.parse(dateString);
      return DateFormatter.iso(date);
    } catch (e) {
      return 'Некорректная дата';
    }
  }
}
