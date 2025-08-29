// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kyrgyz_tourism/core/base/base_state.dart';
// import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
// import 'package:kyrgyz_tourism/core/di/init_di.dart';
// import 'package:kyrgyz_tourism/core/enums/state_status.dart';
// import 'package:kyrgyz_tourism/modules/booking_tour/domain/entities/booking_tour_entity.dart';
// import 'package:kyrgyz_tourism/modules/booking_tour/presentation/cubit/booking_tour_cubit.dart';
// import 'package:table_calendar/table_calendar.dart';

// import '../../domain/usecases/booking_tour_use_case.dart';

// @RoutePage()
// class BookingScreen extends StatefulWidget {
//   final int tourId;
//   const BookingScreen({super.key, required this.tourId});

//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }

// class _BookingScreenState extends State<BookingScreen> {
//   DateTime? selectedDate;
//   List<DateTimeRange>? bookedRanges;
//   DateTimeRange? selectedRange;

//   final _bookingCubit = di<BookingTourCubit>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Бронирование')),
//       body: BlocProvider.value(
//         value: _bookingCubit,

//         child: BlocConsumer<BookingTourCubit, BaseState<BookingTourEntity>>(
//           listener: (context, state) {
//             if (state.status == StateStatus.success &&
//                 state.errorMessage == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Бронирование успешно!')),
//               );
//             } else if (state.status == StateStatus.failure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Ошибка: ${state.errorMessage}')),
//               );
//             }
//           },
//           builder: (context, state) {
//             final bookedDates = <DateTimeRange>[];

//             if (state.model is List) {
//               final list = state.model as List;
//               for (final b in list) {
//                 final start =
//                     (b.departureDateTime is DateTime)
//                         ? b.departureDateTime
//                         : DateTime.parse(b.departureDateTime);
//                 final end = start.add(const Duration(days: 5));
//                 bookedDates.add(DateTimeRange(start: start, end: end));
//               }
//             }

//             return Column(
//               children: [
//                 TableCalendar(
//                   firstDay: DateTime.now(),
//                   lastDay: DateTime.now().add(const Duration(days: 365)),
//                   focusedDay: DateTime.now(),
//                   selectedDayPredicate: (day) => isSameDay(selectedDate, day),
//                   onDaySelected: (selected, _) {
//                     setState(() => selectedDate = selected);
//                   },
//                   calendarBuilders: CalendarBuilders(
//                     defaultBuilder: (context, day, focusedDay) {
//                       for (final range in bookedDates) {
//                         if (day.isAfter(
//                               range.start.subtract(const Duration(days: 1)),
//                             ) &&
//                             day.isBefore(
//                               range.end.add(const Duration(days: 1)),
//                             )) {
//                           return Container(
//                             margin: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.orange.withOpacity(0.5),
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(child: Text('${day.day}')),
//                           );
//                         }
//                       }
//                       return null;
//                     },
//                   ),
//                   calendarStyle: CalendarStyle(
//                     selectedDecoration: BoxDecoration(
//                       color: AppColors.buttonGuide,
//                       shape: BoxShape.circle,
//                     ),
//                     todayDecoration: BoxDecoration(
//                       color: AppColors.buttonGuide.withValues(alpha: 0.5),
//                       shape: BoxShape.circle,
//                     ),
//                     rangeStartDecoration: BoxDecoration(
//                       color: AppColors.buttonGuide,
//                       shape: BoxShape.circle,
//                     ),
//                     rangeEndDecoration: BoxDecoration(
//                       color: AppColors.buttonGuide,
//                       shape: BoxShape.circle,
//                     ),
//                     rangeHighlightColor: AppColors.buttonGuide.withValues(
//                       alpha: 0.2,
//                     ),
//                   ),
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: true,
//                     titleCentered: true,
//                     formatButtonDecoration: BoxDecoration(
//                       color: AppColors.buttonGuide,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     formatButtonTextStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed:
//                       (selectedDate == null ||
//                               state.status == StateStatus.loading)
//                           ? null
//                           : () {
//                             _bookingCubit.bookingTour(
//                               BookingTourParams(
//                                 tourId: widget.tourId,
//                                 selectedDate: selectedDate!.toIso8601String(),
//                                 numberOfPeople: 2,
//                               ),
//                             );
//                           },
//                   child:
//                       (state.status == StateStatus.loading)
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text('Забронировать'),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
