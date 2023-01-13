import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/controller/user_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    userController.checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("스플레시 스크린"),
        ),
      ),
    );
  }
}
