import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/data/network/api/auth/auth_api.dart';
import 'package:gdsc_mini_project/util/token_util.dart';
import 'package:gdsc_mini_project/data/network/api/constant/token.dart';

import '../model/response/signup_response.dart';
import '../network/dio_exception.dart';

class AuthRepository with TokenUtil {
  final AuthApi authApi;

  AuthRepository(this.authApi);

  //코드 요청
  Future<bool> getCodeRequest({required String phoneNumber}) async {
    try {
      final response = await authApi.phoneAuth(phoneNumber: phoneNumber);
      bool result = response.data["status"] == "ok";
      log("코드 전송 여부: $result");
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //코드 확인
  Future<bool> checkCodeReqeust({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response =
          await authApi.codeAuth(phoneNumber: phoneNumber, code: code);
      bool result = response.data["result"]["code"] == code;
      log("코드 일치 여부: $result");
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //로그인 여부 확인
  Future<bool> checkSignedUpRequest({required String phoneNumber}) async {
    try {
      final response = await authApi.checkSignedUp(phoneNumber: phoneNumber);
      bool result = response.data["terms_accepted_at"] != null;
      log("회원가입 여부: $result");
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //회원가입 하기
  Future<bool> signupRequest({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response =
          await authApi.signUp(phoneNumber: phoneNumber, code: code);

      final tokenResult = SignupResponse.fromJson(response.data["token"]);

      saveToken(ACCESS_TOKEN_KEY, tokenResult.accessToken);
      saveToken(REFRESH_TOKEN_KEY, tokenResult.refreshToken);

      return true;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
