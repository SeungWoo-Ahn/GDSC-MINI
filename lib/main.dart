import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/pages/auth/phone_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GDSC MINI PROJECT',
      debugShowCheckedModeBanner: false,
      home: PhoneAuth(),
    );
  }
}
