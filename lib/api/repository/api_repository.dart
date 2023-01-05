import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/api/api.dart';
import 'package:gdsc_mini_project/api/api_end_points.dart';
import 'package:gdsc_mini_project/api/api_utils.dart';
import 'package:gdsc_mini_project/model/code_model.dart';
import 'package:gdsc_mini_project/model/phone_model.dart';

class ApiRepo {
  Future<bool> phoneAuth({required String phoneNumber}) async {
    String url = Api.baseUrl + ApiEndPoints.authorization;

    try {
      final response = await apiUtils.post(
        url: url,
        data: {"auth": PhoneModel(phoneNumber: phoneNumber).toJson()},
        options: Options(validateStatus: (_) => true),
      );
      log(response.data[0].toString());
      return true;
    } catch (e) {
      log("api err: $e");
      return false;
    }
  }

  Future<bool> codeAuth(
      {required String phoneNumber, required String code}) async {
    String url = Api.baseUrl + ApiEndPoints.authorization;

    try {
      final response = await apiUtils.get(
        url: url,
        queryParameters: {
          "auth": CodeModel(phoneNumber: phoneNumber, code: code).toJson()
        },
        options: Options(validateStatus: (_) => true),
      );

      log(response.data["result"].toString());
      return response.data["verify"] == "ok";
    } catch (e) {
      log("codeAuth err: $e");
      return false;
    }
  }

  Future<bool> checkSignUp({required String phoneNumber}) async {
    String url = Api.baseUrl + ApiEndPoints.checkSignedUp;

    try {
      final response = await apiUtils.post(
        url: url,
        data: {"auth": PhoneModel(phoneNumber: phoneNumber).toJson()},
      );

      return response.data["terms_accpeted_at"] != null;
    } catch (e) {
      log("check err: $e");
      return false;
    }
  }
}
