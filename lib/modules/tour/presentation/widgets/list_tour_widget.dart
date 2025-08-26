import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/core/utils/data_formatter.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';
import 'package:kyrgyz_tourism/modules/tour/data/sqflite/schema.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/presentation/widgets/booked_button.dart';
import 'package:kyrgyz_tourism/modules/tour/domain/entities/tour_entity.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/favorite_tour_cubit.dart';

class ListTourWidget extends StatefulWidget {
  const ListTourWidget({super.key, required this.tour});

  final TourEntity tour;

  @override
  State<ListTourWidget> createState() => _ListTourWidgetState();
}

class _ListTourWidgetState extends State<ListTourWidget> {
  final _favouriteTourCubit = di<FavoriteTourCubit>()..getFavorites();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _favouriteTourCubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.network(
                      widget.tour.image.toString(),
                      fit: BoxFit.cover,
                      width: 330,
                      height: 330,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: BlocBuilder<
                      FavoriteTourCubit,
                      BaseState<List<FavoriteTourModel>>
                    >(
                      builder: (context, state) {
                        if (state.status == StateStatus.loading) {
                          return const CircularProgressIndicator();
                        }

                        if (state.status == StateStatus.failure) {
                          return const Icon(Icons.error, color: Colors.red);
                        }

                        final isFavorite = context
                            .read<FavoriteTourCubit>()
                            .isFavorite(widget.tour.id);

                        return InkWell(
                          onTap: () {
                            final favorite = FavoriteTourModel(
                              tourId: widget.tour.id,
                            );

                            _favouriteTourCubit.toggleFavorite(favorite);
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    top: 270,
                    child: BookedButton(
                      tour: widget.tour,
                      onPressed: () {
                        context.router.push(
                          TourDetailsRoute(tour: widget.tour),
                        );
                      },
                      text: S.of(context).booked,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.tour.title.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
              'Дата выезда: ${DateFormatter.iso(DateTime.parse(widget.tour.departureDates.first))}',

              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            Text(
              'Осталось мест: ${widget.tour.placesLeft}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppSizes.paddingLarge),
          ],
        ),
      ),
    );
  }
}
