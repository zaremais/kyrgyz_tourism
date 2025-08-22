// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kyrgyz_tourism/core/base/base_state.dart';
// import 'package:kyrgyz_tourism/core/di/init_di.dart';
// import 'package:kyrgyz_tourism/modules/calendar/domain/entities/booking_date_entity.dart';
// import 'package:kyrgyz_tourism/modules/calendar/domain/usecases/save_booking_date_use_case.dart';
// import 'package:kyrgyz_tourism/modules/calendar/presentation/cubit/save_date_cubit.dart';
// import 'package:table_calendar/table_calendar.dart';

// class BookingCalendarWidget extends StatefulWidget {
//   const BookingCalendarWidget({super.key});

//   @override
//   State<BookingCalendarWidget> createState() => _BookingCalendarWidgetState();
// }

// class _BookingCalendarWidgetState extends State<BookingCalendarWidget> {
//   DateTime? _startDate;
//   DateTime? _endDate;

//   bool _isSameDay(DateTime a, DateTime b) {
//     return a.year == b.year && a.month == b.month && a.day == b.day;
//   }

//   final _calendarCubit = di<BookingCubit>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Выбор даты тура")),
//       body: BlocProvider.value(
//         value: _calendarCubit,

//         child: BlocBuilder<BookingCubit, BaseState<BookingDateEntity>>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 TableCalendar(
//                   firstDay: DateTime(
//                     DateTime.now().year,
//                     DateTime.now().month,
//                     DateTime.now().day,
//                   ),
//                   lastDay: DateTime.now().add(const Duration(days: 365)),
//                   focusedDay: _startDate ?? DateTime.now(),
//                   selectedDayPredicate: (day) {
//                     if (_startDate != null && _endDate == null) {
//                       return _isSameDay(day, _startDate!);
//                     } else if (_startDate != null && _endDate != null) {
//                       return day.isAfter(
//                             _startDate!.subtract(const Duration(days: 1)),
//                           ) &&
//                           day.isBefore(_endDate!.add(const Duration(days: 1)));
//                     }
//                     return false;
//                   },
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       if (_startDate == null || _endDate != null) {
//                         _startDate = selectedDay;
//                         _endDate = null;
//                       } else if (_startDate != null && _endDate == null) {
//                         if (selectedDay.isAfter(_startDate!)) {
//                           _endDate = selectedDay;
//                         } else {
//                           _startDate = selectedDay;
//                           _endDate = null;
//                         }
//                       }
//                     });

//                     _calendarCubit.selectDate(
//                       BookingDateParams(
//                         startDate: _startDate ?? DateTime.now(),
//                         endDate: _endDate ?? DateTime.now(),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed:
//                       (_startDate != null && _endDate != null)
//                           ? () {
//                             _calendarCubit.saveBooking(
//                               BookingDateParams(
//                                 startDate: _startDate!,
//                                 endDate: _endDate!,
//                               ),
//                             );
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Дата бронирования сохранена"),
//                               ),
//                             );
//                           }
//                           : null,
//                   child: const Text("Забронировать"),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
