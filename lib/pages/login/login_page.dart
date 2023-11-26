import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/common/data_info.dart';
import 'package:inha_capstone_project_byoa/common/flutter_toast.dart';
import 'package:inha_capstone_project_byoa/common/images.dart';
import '../../common/text_field.dart';
import '../../json_data/auth_services.dart';

class LoginPage extends StatelessWidget {
  // text controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // login method
    void login() {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      getInfo(usernameController.text, passwordController.text, context).then(
        (arguments) {
          if (arguments.isNotEmpty) {
            Get.offAndToNamed('/byoa');
            nickName = arguments[0];
            token = arguments[1];
            userId = arguments[2];
            id = arguments[3];
            
            log('nickName: $nickName\ntoken: $token\nuserId: $userId\nid: $id');

            flutterToast('로그인 성공!', '#00b09b', '#96c93d');
          } else {
            flutterToast('로그인 실패', '#dc1c13', '#dc1c13');
          }
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(bannerImg, width: 200), // BYOA 로고 이미지
              SizedBox(height: 20),
              SizedBox(width: 400, child: TextFieldWidget(text: '아이디를 입력해주세요', obscureText: false, controller: usernameController)),
              SizedBox(height: 16),
              SizedBox(width: 400, child: TextFieldWidget(text: '비밀번호를 입력해주세요', obscureText: true, controller: passwordController)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('아직 회원이 아니신가요?'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      child: Text('회원가입'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: login,
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
