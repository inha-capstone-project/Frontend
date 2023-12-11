import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxListController extends GetxController {
  // 모바일화면에 배치된 모든 위젯을이 List에 전부 저장됨
  List<Widget> widgetList = [];
  List<Offset> widgetPositions = []; // 위치 정보 저장

  void addWidget(widget, Offset position) {
    widgetList.add(widget);
    widgetPositions.add(position);
    update();

    // for (var item in widgetList) {
    //   print(item);
    // }
  }

  void updateWidgetPosition(int index, Offset newPosition) {
    widgetPositions[index] = newPosition;
    update();
  }

  void getListRemove() {
    widgetList.removeLast();
    update();
  }
}
