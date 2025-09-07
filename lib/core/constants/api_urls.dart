import 'package:kyrgyz_tourism/core/config/environment.dart';

class ApiUrls {
  static String get baseUrl => AppConfig.baseUrl;

  // Auth endpoints
  static const String signup = '/v1/api/sign-up';
  static const String signin = '/v1/api/sign-in';
  static const String verifyCode = '/v1/api/verify';
  static const String getOtpLink = '/v1/api/otp/link';
  static const String confirmOtp = '/v1/api/otp/confirm';
  static const String sendOtp = '/v1/api/otp/register';
  static const String logout = '/v1/api/logout';
  static const String verifyUser = '/v1/api/verify';
  static const String resetPassword = '/v1/api/verify/reset';
  static const String refreshToken = '/v1/api/verify/refresh';

  // User endpoints
  static const String userProfile = '/v1/api/users/profile';
  static const String currentUser = '/v1/api/users/current';

  // Tour endpoints
  static const String getTours = '/v1/api/tours';
  static const String getIndividualTours = '/v1/api/tours/individual';
  static const String filterTours = '/v1/api/tours/filter';

  // Review endpoints
  static const String getReviews = '/v1/api/reviews';

  // Guide endpoints
  static const String guides = '/v1/api/guides';
}
