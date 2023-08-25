class AppUrl {
  // static const String baseUrl = 'https://qa-uremitapi.appinsnap.com/api/v1/';
  static const String baseUrl = 'http://20.212.227.60:3020/api/v1/';
  static const String fileBaseUrl = 'http://20.212.227.60:3020/';
  static const String signUpUrl = "/api/v1/user/register";
  static const String logInUpUrl = "user/login";
  static const String qrCodeById = "QR/getById";
  static const String checkInUrl = "parkingHistory/checkin";
  static const String checkoutUrl = "parkingHistory/checkout";
  static const String generateQRUrl = "QR";
  static const String getAllHistoryUrl = 'parkingHistory/checkinCheckoutHistory';
  static const String getMyHistoryUrl = 'parkingHistory/userHistory?';
  static const String getAllCategoryUrl = "category";
}
