enum Environment { dev, staging, prod }

class AppConfig {
  static Environment _current = Environment.dev;

  static Environment get current => _current;

  static void setEnvironment(Environment env) {
    _current = env;
  }

  // Base URLs
  static const String _devBaseUrl = 'http://34.18.76.114';
  static const String _stagingBaseUrl = 'http://staging-api.kyrgyz-tourism.com';
  static const String _prodBaseUrl = 'https://api.kyrgyz-tourism.com';

  static String get baseUrl {
    switch (_current) {
      case Environment.dev:
        return _devBaseUrl;
      case Environment.staging:
        return _stagingBaseUrl;
      case Environment.prod:
        return _prodBaseUrl;
    }
  }

  // API Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  // App Info
  static String get appName {
    switch (_current) {
      case Environment.dev:
        return 'Kyrgyz Tourism Dev';
      case Environment.staging:
        return 'Kyrgyz Tourism Staging';
      case Environment.prod:
        return 'Kyrgyz Tourism';
    }
  }

  // Debug settings
  static bool get isDebugMode => _current != Environment.prod;
  static bool get enableLogging => _current != Environment.prod;
  static bool get enableCrashlytics => _current == Environment.prod;

  // Feature flags
  static bool get enableAnalytics => _current == Environment.prod;
  static bool get enablePushNotifications => true;
  static bool get enableOfflineMode => true;
}
