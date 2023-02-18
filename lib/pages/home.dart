import 'package:flutter/material.dart';
import 'package:gdsc_mini_project/pages/new_post.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('홈 화면 입니다'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(NewPost()),
        child: Icon(Icons.add),
      ),
    );
  }
}
