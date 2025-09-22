import 'package:kyrgyz_tourism/features/tour/domain/entities/tour_entity.dart';

class PaginatedTours {
  final List<TourEntity> tours;
  final int totalPages;
  final int currentPage;

  const PaginatedTours({
    required this.tours,
    required this.totalPages,
    required this.currentPage,
  });

  bool get hasNextPage => currentPage < totalPages;
}
