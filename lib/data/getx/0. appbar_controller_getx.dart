import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxAppBarController extends GetxController {
  String text = 'First set your app name';
  Color color = Colors.blue;

  // 앱바 타이틀 설정
  void setAppBarTitle(value) {
    text = value;
    update();
  }

  // 앱바 색상 설정
  void setAppBarColor(value) {
    color = value;
    update();
  }
}
