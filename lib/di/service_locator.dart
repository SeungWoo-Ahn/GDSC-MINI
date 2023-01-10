import 'package:dio/dio.dart';
import 'package:gdsc_mini_project/controller/auth_controller.dart';
import 'package:gdsc_mini_project/controller/user_controller.dart';
import 'package:gdsc_mini_project/data/network/api/auth/auth_api.dart';
import 'package:gdsc_mini_project/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/network/api/user/user_api.dart';
import '../data/network/dio_client.dart';
import '../data/repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(getIt.get<AuthApi>()));

  getIt.registerSingleton(AuthController());

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  getIt.registerSingleton(UserController());
}
