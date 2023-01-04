import 'package:gdsc_mini_project/api/repository/api_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _hasCodeAuth = false.obs;
  final _isSignUp = false.obs;

  bool get hasCodeAuth => _hasCodeAuth.value;
  bool get isSignUp => _isSignUp.value;

  //번호 인증
  Future<void> phoneAuth({required String phoneNumber}) async {
    await ApiRepo().phoneAuth(phoneNumber: phoneNumber);
  }

  //코드 인증
  void codeAuth({required String phoneNumber, required String code}) async {
    final result =
        await ApiRepo().codeAuth(phoneNumber: phoneNumber, code: code);
    _hasCodeAuth.value = result;
  }

  //회원 확인
  void checkSignUp({required String phoneNumber}) async {
    final result = await ApiRepo().checkSignUp(phoneNumber: phoneNumber);
    _isSignUp.value = result;
  }
}
