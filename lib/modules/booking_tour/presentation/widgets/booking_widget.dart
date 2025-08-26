import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatelessWidget {
  final List<DateTime> availableDates;
  final Function(DateTime) onDateSelected;
  final DateTime? selectedDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const BookingCalendar({
    super.key,
    required this.availableDates,
    required this.onDateSelected,
    this.selectedDate,
    required this.firstDate,
    required this.lastDate,
  });

  bool _isDateAvailable(DateTime date) {
    return availableDates.any(
      (availableDate) =>
          availableDate.year == date.year &&
          availableDate.month == date.month &&
          availableDate.day == date.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: firstDate,
      lastDay: lastDate,
      focusedDay: selectedDate ?? DateTime.now(),
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onDaySelected: (selectedDay, focusedDay) {
        if (!_isDateAvailable(selectedDay)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Эта дата недоступна для бронирования'),
            ),
          );
          return;
        }

        onDateSelected(selectedDay);
      },
      selectedDayPredicate:
          (day) => selectedDate != null && isSameDay(selectedDate, day),
      enabledDayPredicate: _isDateAvailable,
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}
