import 'package:kyrgyz_tourism/core/config/environment.dart';

class AppLogger {
  static void debug(String message, {String? tag, dynamic data}) {
    if (AppConfig.enableLogging) {
      _log('DEBUG', message, tag: tag, data: data);
    }
  }

  static void info(String message, {String? tag, dynamic data}) {
    if (AppConfig.enableLogging) {
      _log('INFO', message, tag: tag, data: data);
    }
  }

  static void warning(String message, {String? tag, dynamic data}) {
    if (AppConfig.enableLogging) {
      _log('WARNING', message, tag: tag, data: data);
    }
  }

  static void error(
    String message, {
    String? tag,
    dynamic data,
    StackTrace? stackTrace,
  }) {
    if (AppConfig.enableLogging) {
      _log('ERROR', message, tag: tag, data: data);
      if (stackTrace != null) {
        print('Stack trace: $stackTrace');
      }
    }
  }

  static void _log(String level, String message, {String? tag, dynamic data}) {
    final timestamp = DateTime.now().toIso8601String();
    final tagStr = tag != null ? '[$tag] ' : '';
    final dataStr = data != null ? ' | Data: $data' : '';

    print('[$timestamp] [$level] $tagStr$message$dataStr');
  }

  // Network logging
  static void logRequest(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) {
    debug(
      '$method $url',
      tag: 'NETWORK',
      data: {'data': data, 'headers': headers},
    );
  }

  static void logResponse(
    String method,
    String url,
    int statusCode, {
    dynamic data,
  }) {
    final level = statusCode >= 400 ? 'error' : 'info';
    if (level == 'error') {
      error('$method $url - $statusCode', tag: 'NETWORK', data: data);
    } else {
      info('$method $url - $statusCode', tag: 'NETWORK', data: data);
    }
  }
}
