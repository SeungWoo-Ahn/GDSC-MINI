import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/common/color.dart';
import 'package:gdsc_mini_project/common/dimen.dart';
import 'package:gdsc_mini_project/common/string.dart';
import 'package:gdsc_mini_project/controller/auth_controller.dart';
import 'package:gdsc_mini_project/pages/home.dart';
import 'package:get/get.dart';

class CodeAuth extends StatelessWidget {
  CodeAuth({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  final TextEditingController codeInput = TextEditingController();

  AuthController authController = Get.find<AuthController>();

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
                str_code_auth_explain,
                style: titleStyle,
              ),
              SizedBox(height: 40),
              TextField(
                controller: codeInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: str_code_input_hint,
                  border: OutlineInputBorder(
                    borderRadius: cornerRadius,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  // 인증번호 맞는지 확인
                  if (await authController.codeAuth(
                      phoneNumber: phoneNumber, code: codeInput.text)) {
                    //가입된 계정인지 확인
                    if (await authController.checkSignUp(
                        phoneNumber: phoneNumber)) {
                      Get.offAll(HomeScreen());
                    }
                    //가입이 안되있으면
                    else {
                      Get.snackbar("Err", str_signup_need_err);
                    }
                  } else {
                    Get.snackbar("Err", str_code_auth_err);
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
                    str_code_auth_button,
                    style: buttonStyle,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
