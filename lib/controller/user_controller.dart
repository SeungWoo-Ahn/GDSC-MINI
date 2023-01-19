import 'package:gdsc_mini_project/data/repository/user_repository.dart';
import 'package:gdsc_mini_project/di/service_locator.dart';
import 'package:get/get.dart';

import '../data/model/user_model.dart';

class UserController extends GetxController {
  final userRepository = getIt.get<UserRepository>();

  Future<UserModel?> getUserData() async {
    final user = await userRepository.getUserData();
    return user;
  }
}
