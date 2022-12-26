import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/api/api.dart';
import 'package:gdsc_mini_project/api/api_end_points.dart';
import 'package:gdsc_mini_project/model/code_auth_model.dart';
import 'package:gdsc_mini_project/model/phone_auth_model.dart';

class AuthService {
  String apiUrl = Api.baseUrl + ApiEndPoints.authorization;

  Future<bool> phoneAuth({required String phoneNum}) async {
    try {
      final response = await Dio().post(
        apiUrl,
        data: {
          "auth": PhoneAuthModel(phoneNum: phoneNum).toJson(),
        },
      );
      return response.data["status"] == "ok";
    } catch (e) {
      return false;
    }
  }

  Future<bool> codeAuth(
      {required String phoneNum, required String code}) async {
    try {
      final response = await Dio().get(
        apiUrl,
        queryParameters: {
          "auth": CodeAuthModel(phoneNum: phoneNum, code: code).toJson(),
        },
      );
      return response.data["result"]["verify"] == "ok" ? true : false;
    } catch (e) {
      return false;
    }
  }
}
