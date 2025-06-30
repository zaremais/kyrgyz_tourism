import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TourCalendar extends StatefulWidget {
  const TourCalendar({super.key});

  @override
  State<TourCalendar> createState() => _TourCalendarState();
}

class _TourCalendarState extends State<TourCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  String _selectedDestination = 'Париж';
  final List<String> _destinations = [
    'Париж',
    'Рим',
    'Лондон',
    'Нью-Йорк',
    'Токио',
  ];

  int _peopleCount = 1;

  void _confirmBooking(BuildContext context) {
    String message;
    if (_selectedDay != null) {
      message =
          'Вы забронировали поездку с ${DateFormat('dd.MM.yyyy').format(_rangeStart!)} '
          'по ${DateFormat('dd.MM.yyyy').format(_rangeEnd!)}';
    } else {
      message =
          'Вы забронировали поездку на ${DateFormat('dd.MM.yyyy').format(_selectedDay!)}';
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Бронирование подтверждено'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: _selectedDestination,
            items:
                _destinations.map((destination) {
                  return DropdownMenuItem(
                    value: destination,
                    child: Text(destination),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDestination = value!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Куда',
              border: OutlineInputBorder(),
            ),
          ),

          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _rangeStart = null;
                _rangeEnd = null;
              });
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _focusedDay = focusedDay;
                _rangeStart = start;
                _rangeEnd = end;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.buttonGuide,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.buttonGuide.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              rangeStartDecoration: BoxDecoration(
                color: AppColors.buttonGuide,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: BoxDecoration(
                color: AppColors.buttonGuide,
                shape: BoxShape.circle,
              ),
              rangeHighlightColor: AppColors.buttonGuide.withValues(alpha: 0.2),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: AppColors.buttonGuide,
                borderRadius: BorderRadius.circular(20),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          if (_selectedDay != null || _rangeStart != null)
            Column(
              children: [
                if (_selectedDay != null)
                  _buildDateInfo('Выбранная дата:', _selectedDay!),
                if (_rangeStart != null && _rangeEnd != null)
                  Column(
                    children: [
                      _buildDateInfo('Дата заезда:', _rangeStart!),
                      _buildDateInfo('Дата выезда:', _rangeEnd!),
                      _buildDurationInfo(_rangeStart!, _rangeEnd!),
                    ],
                  ),
                const SizedBox(height: 20),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Количество человек:', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_peopleCount > 1) _peopleCount--;
                      });
                    },
                  ),
                  Text('$_peopleCount', style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _peopleCount++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),

          SizedBox(
            // width: 360,
            // height: 50,
            child: ElevatedButton(
              onPressed:
                  (_selectedDay != null || _rangeStart != null)
                      ? () => _confirmBooking(context)
                      : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.buttonGuide,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  context.router.replace(IsBookedRoute());
                },
                child: const Text(
                  'Забронировать',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDateInfo(String label, DateTime date) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(
          DateFormat('dd.MM.yyyy').format(date),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

Widget _buildDurationInfo(DateTime start, DateTime end) {
  final duration = end.difference(start).inDays;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      'Продолжительность: $duration ${_getDayText(duration)}',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

String _getDayText(int days) {
  if (days % 10 == 1 && days % 100 != 11) return 'день';
  if (days % 10 >= 2 &&
      days % 10 <= 4 &&
      (days % 100 < 10 || days % 100 >= 20)) {
    return 'дня';
  }
  return 'дней';
}
