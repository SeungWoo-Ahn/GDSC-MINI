import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../model/request/code_request.dart';
import '../../../model/request/phone_request.dart';
import '../../../model/request/signup_request.dart';
import '../../dio_client.dart';
import '../constant/end_points.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  //휴대폰 인증
  Future<Response> phoneAuth({required String phoneNumber}) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.authorization,
        data: {
          "auth": PhoneRequest(phoneNumber: phoneNumber).toJson(),
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //코드 확인
  Future<Response> codeAuth(
      {required String phoneNumber, required String code}) async {
    try {
      final Response response = await dioClient.get(
        Endpoints.authorization,
        queryParameters: {
          "auth": CodeRequest(phoneNumber: phoneNumber, code: code).toJson()
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //가입된지 체크
  Future<Response> checkSignedUp({required String phoneNumber}) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.checkSignedUp,
        data: {
          "auth": PhoneRequest(phoneNumber: phoneNumber).toJson(),
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //회원가입
  Future<Response> signUp({
    required String phoneNumber,
    required String code,
  }) async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String serialized = stringToBase64.encode("$phoneNumber:$code");
    try {
      final Response response = await dioClient.post(
        Endpoints.signUp,
        options: Options(
          headers: {
            "Authorization": "Basic $serialized",
          },
        ),
        data: {
          "auth": SignupRequest(termsAcceptedAt: DateTime.now()).toJson(),
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
