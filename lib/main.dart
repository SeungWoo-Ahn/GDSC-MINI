import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/pages/auth/phone_auth.dart';
import 'package:get/get.dart';

void main() {
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
