import 'package:flutter/cupertino.dart';
import 'package:gdsc_mini_project/data/repository/auth_repository.dart';
import 'package:gdsc_mini_project/di/service_locator.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authRepository = getIt.get<AuthRepository>();

  Future<bool> getCode({required String phoneNumber}) async {
    final result =
        await authRepository.getCodeRequest(phoneNumber: phoneNumber);

    return result;
  }

  Future<bool> checkCode({
    required String phoneNumber,
    required String code,
  }) async {
    final result = await authRepository.checkCodeReqeust(
        phoneNumber: phoneNumber, code: code);

    return result;
  }

  Future<bool> checkSignedUp({required String phoneNumber}) async {
    final result =
        await authRepository.checkSignedUpRequest(phoneNumber: phoneNumber);
    return result;
  }

  Future<bool> signUp({
    required String phoneNumber,
    required String code,
  }) async {
    final result =
        authRepository.signupRequest(phoneNumber: phoneNumber, code: code);

    return result;
  }
}
