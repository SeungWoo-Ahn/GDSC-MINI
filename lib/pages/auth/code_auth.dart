import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/common/color.dart';
import 'package:gdsc_mini_project/common/dimen.dart';
import 'package:gdsc_mini_project/common/string.dart';
import 'package:gdsc_mini_project/pages/home.dart';
import 'package:get/get.dart';

class CodeAuth extends StatefulWidget {
  const CodeAuth({super.key});

  @override
  State<CodeAuth> createState() => _CodeAuthState();
}

class _CodeAuthState extends State<CodeAuth> {
  final TextEditingController codeInput = TextEditingController();
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
                onTap: () {
                  Get.offAll(HomeScreen());
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
