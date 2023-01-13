import 'package:gdsc_mini_project/data/repository/user_repository.dart';
import 'package:gdsc_mini_project/di/service_locator.dart';
import 'package:gdsc_mini_project/util/token_util.dart';
import 'package:get/get.dart';

import '../data/model/user_model.dart';
import '../data/network/api/constant/token.dart';
import '../pages/auth/phone_auth.dart';
import '../pages/home.dart';

class UserController extends GetxController with TokenUtil {
  final userRepository = getIt.get<UserRepository>();

  Rxn<UserModel> currentUser = Rxn<UserModel>();

  Future<UserModel?> getUserData() async {
    final user = await userRepository.getUserData();
    return user;
  }

  Future<void> checkToken() async {
    String? accessToken = getToken(ACCESS_TOKEN_KEY);

    if (accessToken == null || accessToken.isEmpty) {
      Get.off(PhoneAuth());
      return;
    }
    userRepository.getUserData().then((user) {
      if (user is UserModel) {
        currentUser.value = user;
        Get.offAll(() => HomeScreen());
      }
    });
  }
}
