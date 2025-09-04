import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/utils/data_formatter.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';

class TourCard extends StatefulWidget {
  final TourEntity tour;
  final VoidCallback? onTap;

  const TourCard({super.key, required this.tour, this.onTap});

  @override
  State<TourCard> createState() => _TourCardState();
}

class _TourCardState extends State<TourCard> {
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
              widget.tour.image.toString(),
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
                      widget.tour.title ?? 'Без названия',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.tour.rating.toString(),
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
                '${widget.tour.tourDuration} дня',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '${widget.tour.price} сом',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Text(
                'Дата выезда: ${DateFormatter.iso(DateTime.parse(widget.tour.departureDates!.first))}',

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Text(
                'Осталось мест: ${widget.tour.placesLeft}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
