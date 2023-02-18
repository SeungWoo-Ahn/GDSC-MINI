import 'package:flutter/cupertino.dart';
import 'package:gdsc_mini_project/controller/user_controller.dart';
import 'package:gdsc_mini_project/data/repository/post_repository.dart';
import 'package:gdsc_mini_project/di/service_locator.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final postRepository = getIt.get<PostRepository>();
  final titleInput = TextEditingController();
  final descriptionInput = TextEditingController();

  var postErrorMsg = "";

  UserController userCtrl = Get.find<UserController>();

  Future<bool> writeNewPost() async {
    if (titleInput.text.isEmpty) {
      postErrorMsg = "제목을 입력해주세요";
      return false;
    }

    if (descriptionInput.text.isEmpty) {
      postErrorMsg = "설명을 입력해주세요";
      return false;
    }

    final result = await postRepository.writePostRequest(
        userId: userCtrl.currentUser.value!.id!,
        title: titleInput.text,
        description: descriptionInput.text);

    postErrorMsg = "네트워크 오류";
    return result;
  }
}
