import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/pages/home.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/dimen.dart';
import '../../common/string.dart';
import '../../controller/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    super.key,
    required this.phoneNumber,
    required this.code,
  });

  final String phoneNumber;
  final String code;

  @override
  State<SignupScreen> createState() =>
      _SignupScreenState(phoneNumber: phoneNumber, code: code);
}

class _SignupScreenState extends State<SignupScreen> {
  _SignupScreenState({required this.phoneNumber, required this.code});

  final String phoneNumber;
  final String code;
  final TextEditingController phoneInput = TextEditingController();

  final TextEditingController codeInput = TextEditingController();

  AuthController authController = Get.find<AuthController>();

  var _isChecked = false;

  @override
  void initState() {
    super.initState();
    phoneInput.text = phoneNumber.toString();
    codeInput.text = code.toString();
  }

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
                str_signup_title,
                style: titleStyle,
              ),
              SizedBox(height: 40),
              TextField(
                controller: phoneInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: str_phone_input_hint,
                  labelText: str_phone_input_hint,
                  border: OutlineInputBorder(
                    borderRadius: cornerRadius,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: codeInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: str_code_input_hint,
                  labelText: str_code_input_hint,
                  border: OutlineInputBorder(
                    borderRadius: cornerRadius,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                  Text(
                    str_signup_accept,
                    style: contentStyle,
                  )
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  if (_isChecked) {
                    if (await authController.signUp(
                        phoneNumber: phoneInput.text, code: codeInput.text)) {
                      Get.offAll(HomeScreen());
                    } else {
                      Get.snackbar("가입 오류", "다시 시도해주세요");
                    }
                  } else {
                    Get.snackbar("필수", srt_signup_err);
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
                    str_signup_button,
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
