import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/data/network/api/poset/post_api.dart';
import 'package:gdsc_mini_project/data/network/dio_exception.dart';

class PostRepository {
  final PostApi postApi;

  PostRepository(this.postApi);

  //새 글 작성 요청
  Future<bool> writePostRequest({
    required int userId,
    required String title,
    required String description,
  }) async {
    try {
      final response = await postApi.writePost(
          userId: userId, title: title, description: description);
      bool result = response.data["status"] == "created";
      log("새 글 작성 여부 : $result");
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
