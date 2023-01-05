import 'dart:developer';

import 'package:gdsc_mini_project/api/repository/api_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //번호 인증
  Future<void> phoneAuth({required String phoneNumber}) async {
    log('number: $phoneNumber');
    await ApiRepo().phoneAuth(phoneNumber: phoneNumber);
  }

  //코드 인증
  Future<bool> codeAuth(
      {required String phoneNumber, required String code}) async {
    final result =
        await ApiRepo().codeAuth(phoneNumber: phoneNumber, code: code);
    return result;
  }

  //회원 확인
  Future<bool> checkSignUp({required String phoneNumber}) async {
    final result = await ApiRepo().checkSignUp(phoneNumber: phoneNumber);
    return result;
  }
}
