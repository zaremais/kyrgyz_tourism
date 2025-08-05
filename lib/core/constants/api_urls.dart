class ApiUrls {
  static const String baseUrl = 'http://34.18.76.114';
  static const String signup = '/v1/api/sign-up';
  static String checkNickname(String nickaname) => '/v1/api/exists/$nickaname';
  static const String signin = '/v1/api/sign-in';
  static const String verifyCode = '/v1/api/verify';
  static const String getOtpLink = '/v1/api/otp/link';
  static const String confirmOtp = '/v1/api/otp/confirm';
  static const String registerAndSendOtp = '/v1/api/otp/register';

  static const String getCurrentUser = '/v1/api/profiles/me';
  static const String logout = '/v1/api/logout';
  static const String getTours = '/v1/api/tours';
  static const String getIndividualTours = '/v1/api/tours/individual';
  static const String getReviews = '/v1/api/reviews';
  static const String getGuides = '/v1/api/guides';
  static const String getProfile = '/v1/api/profiles/me';
  static const String refreshToken = '/v1/api/refresh';
  static const String getPayment = '/v1/api/qr/mbank';
  static const String promocode = '/v1/api/promo-codes';
  static const String isBookedTour = 'v1/api/bookings';
  static const String confirmBooked = '/v1/api/bookings';
}
