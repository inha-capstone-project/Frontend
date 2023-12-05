import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxListController extends GetxController {
  // 모바일화면에 배치된 모든 위젯을이 List에 전부 저장됨
  List<Widget> widgetList = [];

  void addWidget(widget) {
    widgetList.add(widget);
    update();

    for (var item in widgetList) {
      print(item);
    }
  }

  void getListRemove() {
    widgetList.removeLast();
    update();
  }
}
