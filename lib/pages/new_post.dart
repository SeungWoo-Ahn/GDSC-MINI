import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/common/color.dart';
import 'package:gdsc_mini_project/common/dimen.dart';
import 'package:gdsc_mini_project/common/string.dart';
import 'package:gdsc_mini_project/controller/post_controller.dart';
import 'package:get/get.dart';

class NewPost extends StatelessWidget {
  NewPost({super.key});

  PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                str_post,
                style: titleStyle,
              ),
              SizedBox(height: 40),
              TextField(
                controller: controller.titleInput,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: str_post_title_hint,
                  labelText: str_post_title_hint,
                  border: OutlineInputBorder(
                    borderRadius: cornerRadius,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.descriptionInput,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: str_post_description_hint,
                  labelText: str_post_description_hint,
                  border: OutlineInputBorder(
                    borderRadius: cornerRadius,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  if (await controller.writeNewPost()) {
                    Get.back();
                  } else {
                    Get.snackbar("에러", controller.postErrorMsg);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: buttonPadding,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: cornerRadius,
                  ),
                  child: Center(
                      child: Text(
                    str_post_button,
                    style: buttonStyle,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
