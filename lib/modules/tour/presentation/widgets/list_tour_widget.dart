import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/widgets/booked_button.dart';
import 'package:kyrgyz_tourism/modules/tour/data/sqflite/schema.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 49),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: Image.network(
                      widget.tour.image,
                      fit: BoxFit.cover,
                      width: 308,
                      height: 308,
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

                        if (state.status == StateStatus.error) {
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

                            context.read<FavoriteTourCubit>().toggleFavorite(
                              favorite,
                            );
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
                    top: 250,
                    child: BookedButton(
                      tour: widget.tour,
                      onPressed: () {
                        context.router.replace(
                          TourDetailsRoute(tour: widget.tour),
                        );
                      },
                      text: 'Забронировать',
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
                  child: Text(widget.tour.title, style: FontStyles.bodyInfo),
                ),
                Row(
                  children: [
                    Text(
                      widget.tour.rating.toString(),
                      style: FontStyles.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Image.asset('assets/images/star.png', width: 24),
                  ],
                ),
              ],
            ),
            Text('${widget.tour.tourDuration} дня'),
            Text('${widget.tour.price.toStringAsFixed(2)} сом'),
            Text('Дата выезда: ${widget.tour.departureDate}'),
            Text('Осталось мест: ${widget.tour.placesLeft}'),
            const SizedBox(height: AppSizes.paddingHorizontal),
          ],
        ),
      ),
    );
  }
}
