import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/tour/presentation/cubit/calendar_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

typedef OnDateSelected = void Function(DateTime selectedDate);

class TourCalendar extends StatefulWidget {
  final OnDateSelected onDateSelected;
  const TourCalendar({super.key, required this.onDateSelected});

  @override
  State<TourCalendar> createState() => _TourCalendarState();
}

class _TourCalendarState extends State<TourCalendar> {
  final _tourCalendarCubit = di<CalendarCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _tourCalendarCubit,
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              headerVisible: false,
              firstDay: DateTime.utc(2010, 10, 16),
              focusedDay: DateTime.now(),
              lastDay: DateTime.utc(2100, 10, 16),
              selectedDayPredicate: (day) => isSameDay(state.selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                _tourCalendarCubit.selectDate(selectedDay);
                widget.onDateSelected(selectedDay);
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: AppColors.buttonGuide,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
