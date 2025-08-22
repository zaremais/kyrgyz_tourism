import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_colors.dart';
import 'package:kyrgyz_tourism/core/di/init_di.dart';
import 'package:kyrgyz_tourism/core/widgets/custom_button_widget.dart';

import 'package:kyrgyz_tourism/modules/booking_tour/domain/usecases/booking_tour_use_case.dart';
import 'package:kyrgyz_tourism/modules/booking_tour/presentation/cubit/booking_tour_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class TourCalendar extends StatefulWidget {
  const TourCalendar({super.key});

  @override
  State<TourCalendar> createState() => _TourCalendarState();
}

class _TourCalendarState extends State<TourCalendar> {
  DateTime? _startDate;
  DateTime? _endDate;

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: _startDate ?? DateTime.now(),
            selectedDayPredicate: (day) {
              if (_startDate != null && _endDate == null) {
                return _isSameDay(day, _startDate!);
              } else if (_startDate != null && _endDate != null) {
                return day.isAfter(
                      _startDate!.subtract(const Duration(days: 1)),
                    ) &&
                    day.isBefore(_endDate!.add(const Duration(days: 1)));
              }
              return false;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                if (_startDate == null || _endDate != null) {
                  _startDate = selectedDay;
                  _endDate = null;
                } else if (_startDate != null && _endDate == null) {
                  if (selectedDay.isAfter(_startDate!)) {
                    _endDate = selectedDay;
                  } else {
                    _startDate = selectedDay;
                    _endDate = null;
                  }
                }
              });
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
          CustomButtonWidget(
            text: 'Забронировать',
            onPressed: () {
              context.router.push(IsBookedRoute());
            },

            backgroundColor: AppColors.buttonGuide,
          ),
        ],
      ),
    );
  }
}
