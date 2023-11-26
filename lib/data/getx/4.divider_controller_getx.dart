import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxDividerController extends GetxController {
  double thickness = 3.0;
  Color color = Colors.black;

  EdgeInsets padding = EdgeInsets.zero;

  void setDividerThickness(double value) {
    thickness = value;
    update();
  }

  void setDividerColor(Color value) {
    color = value;
    update();
  }

  void setDividerPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
