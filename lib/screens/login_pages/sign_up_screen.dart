import 'package:flutter/material.dart';
import '../../common/text_field.dart';
import '../../common/text_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '회원가입',
          style: textStyle1().copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFieldWidget(text: '아이디')),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // 함수 필요
                  },
                  child: Text('중복확인'),
                ),
              ],
            ),
            TextFieldWidget(text: '비밀번호', obscureText: true),
            TextFieldWidget(text: '비밀번호 확인', obscureText: true),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 함수 필요
                    },
                    child: Text(
                      '회원가입',
                      style: textStyle1(),
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
