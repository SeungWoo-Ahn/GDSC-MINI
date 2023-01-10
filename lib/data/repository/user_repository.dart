import 'dart:developer';

import 'package:dio/dio.dart';

import '../network/api/user/user_api.dart';
import '../model/response/get_user_response.dart';
import '../model/user_model.dart';
import '../network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  //유저 조회
  Future<UserModel?> getUserData() async {
    try {
      final response = await userApi.getUser();
      final result = GetUserResponse.fromJson(response.data).userModel;
      log("유저 정보: $result");
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
