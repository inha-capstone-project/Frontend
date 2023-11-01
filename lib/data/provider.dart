import 'package:flutter/material.dart';
import 'package:inha_capstone_project_byoa/data/datas.dart';
import 'package:inha_capstone_project_byoa/data/test.dart';

class Properties with ChangeNotifier {
  List<Widget> properties = [];

  double height;
  double width;
  Color color;

  Properties({required this.color, required this.height, required this.width});

  // 위젯을 클릭시 보여줄 상태 창
  void changeProperties() {
    properties.add(Test());
    notifyListeners();
  }

  // 컨네이너 높이 변경
  void changeContainerHeight() {
    height = valueHeight;
    notifyListeners();
  }

  // 컨테이너 가로 변경
  void changeContainerWidth() {
    width = valueWidth;
    notifyListeners();
  }

  // 컨테이너 색상 변경
  void changeContainerColor() {
    color = valueColor;
    notifyListeners();
  }
}
