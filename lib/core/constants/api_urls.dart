class ApiUrls {
  static const String baseUrl = 'http://34.18.76.114';

  static const String signup = '/v1/api/sign-up';
  static const String passwordReset = '/v1/api/password-reset';
  static const String passwordConfirm = '/v1/api/password-reset/confirm';

  static String checkNickname(String nickname) => '/v1/api/exists/$nickname';
  static const String signin = '/v1/api/sign-in';
  static const String verifyCode = '/v1/api/verify';
  static const String getOtpLink = '/v1/api/otp/link';
  static const String confirmOtp = '/v1/api/otp/confirm';
  static const String registerAndSendOtp = '/v1/api/otp/register';
  static const String getContact = '/v1/api/contact-requests';
  static const String createContact = '/v1/api/contact-requests';
  static const String getCurrentUser = '/v1/api/profiles/me';
  static const String bookingTour = '/v1/api/bookings';
  static const String logout = '/v1/api/logout';
  static const String getTours = '/v1/api/tours';
  static const String getIndividualTours = '/v1/api/tours/individual';
  static const String filterTours = '/v1/api/tours/filter';
  static const String getReviews = '/v1/api/reviews';
  static const String getGuides = '/v1/api/guides';
  static const String getProfile = '/v1/api/profiles/me';
  static const String refreshToken = '/v1/api/refresh';
  static const String getPayment = '/v1/api/qr/mbank';
  static const String promocode = '/v1/api/promo-codes';
  static String booking(int tourId) => '/v1/api/bookings/available/$tourId';
  static const String confirmBooked = '/v1/api/bookings';
  static const String getQrCode = '/v1/api/qr/mbank';
}
