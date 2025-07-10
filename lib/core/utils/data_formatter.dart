import 'package:intl/intl.dart';

class DateFormatter {
  /// Формат: 09.07.2025
  static String ddMMyyyy(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  /// Формат: 9 июля 2025 г.
  static String fullDateRu(DateTime date) {
    return DateFormat.yMMMMd('ru').format(date);
  }

  /// Формат: 2025-07-09
  static String iso(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Формат: 09.07
  static String dayMonth(DateTime date) {
    return DateFormat('dd.MM').format(date);
  }

  /// Формат: 09.07.2025 14:30
  static String withTime(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}
