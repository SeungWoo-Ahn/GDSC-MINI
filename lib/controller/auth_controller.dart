import 'package:gdsc_mini_project/service/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  Future<void> phoneAuth({required String phoneNum}) async {
    await authService.phoneAuth(phoneNum: phoneNum);
  }

  Future<bool> codeAuth(
      {required String phoneNum, required String code}) async {
    bool result = await authService.codeAuth(phoneNum: phoneNum, code: code);
    return result;
  }
}
