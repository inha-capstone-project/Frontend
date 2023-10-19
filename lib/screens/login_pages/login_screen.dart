import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inha_capstone_project_byoa/common/images.dart';
import '../../common/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Image.asset(
                bannerImg,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            SizedBox(height: 16),
            TextFieldWidget(
              text: '아이디를 입력해주세요',
              obscureText: false,
            ),
            SizedBox(height: 16),
            TextFieldWidget(text: '비밀번호를 입력해주세요', obscureText: true),
            SizedBox(height: 40),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('아직 회원이 아니신가요?'),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    context.push('/signUp');
                  },
                  child: Text('회원가입 ->'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}