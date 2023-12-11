import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrongPage extends StatelessWidget {
  const WrongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              '잘못된 접근 방식 입니다.\n다시 로그인 해주세요',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 30,
              ),
              onPressed: () => Get.offAndToNamed('/login'),
              child: Text('홈으로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}
