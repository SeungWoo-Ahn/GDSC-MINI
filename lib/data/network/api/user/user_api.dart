import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/util/token_util.dart';

import '../constant/token.dart';
import '../../dio_client.dart';
import '../constant/end_points.dart';

class UserApi with TokenUtil {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  //유저 정보 가져오기
  Future<Response> getUser() async {
    try {
      final Response response = await dioClient.get(
        Endpoints.users,
        options: Options(
          headers: {
            "Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
