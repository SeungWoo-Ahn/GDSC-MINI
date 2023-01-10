class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:3000/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String authorization = "api/v1/authorizations";
  static const String checkSignedUp = "api/v1/authorizations/check_signed_up";
  static const String signUp = "api/v1/authorizations/sign_up"; // (유저 가입하기)
  static const String users = "api/v1/users/"; // (유저 정보 받아오기)
}
