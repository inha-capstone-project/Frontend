import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxIconController extends GetxController {
  IconData icon = Icons.home;
  double size = 30.0;
  Color color = Colors.red;

  EdgeInsets padding = EdgeInsets.zero;

  void setIcon(value) {
    icon = value;
    update();
  }

  void setIconSize(value) {
    size = value;
    update();
  }

  void setIconColor(value) {
    color = value;
    update();
  }

  void setIconPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
