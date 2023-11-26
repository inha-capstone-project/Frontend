import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxContainerController extends GetxController {
  double height = 300;
  double width = 300;
  Color color = Colors.grey[300]!;

  // 컨네이너 높이 변경
  void changeContainerHeight(value) {
    height = double.parse(value);
    update();
  }

  // 컨테이너 가로 변경
  void changeContainerWidth(value) {
    width = double.parse(value);
    update();
  }

  // 컨테이너 색상 변경
  void changeContainerColor(value) {
    color = value;
    update();
  }
}
