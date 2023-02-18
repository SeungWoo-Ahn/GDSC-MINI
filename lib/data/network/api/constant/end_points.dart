class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:3000";

  // receiveTimeout
  static const int receiveTimeout = 25000;

  // connectTimeout
  static const int connectionTimeout = 25000;

  static const String authorization = "/api/v1/authorizations"; //(인증 api)
  static const String checkSignedUp =
      "/api/v1/authorizations/check_signed_up"; //(회원인지 확인하기)
  static const String signUp = "/api/v1/authorizations/sign_up"; // (유저 가입하기)
  static const String users = "/api/v1/users/"; // (유저 정보 받아오기)
  static const String login = "/api/v1/authorizations/login"; //(유저 로그인하기)
  static const String post = "/api/v1/posts "; //(새 글 만들기)
}
