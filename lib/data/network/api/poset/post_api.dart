import 'package:gdsc_mini_project/data/model/request/post_request.dart';
import 'package:gdsc_mini_project/data/network/api/constant/end_points.dart';
import 'package:gdsc_mini_project/data/network/dio_client.dart';

import 'package:dio/dio.dart';

class PostApi {
  final DioClient dioClient;

  PostApi({required this.dioClient});

  //새 글 작성하기
  Future<Response> writePost({
    required int userId,
    required String title,
    required String description,
  }) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.post,
        data: {
          "post": PostRequest(
            user_id: userId,
            title: title,
            description: description,
          ).toJson(),
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
