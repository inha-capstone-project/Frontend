import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxTextFieldController extends GetxController {
  double width = 100;
  double height = 100;

  EdgeInsets padding = EdgeInsets.zero;

  void setTextFieldWidth(value) {
    width = value;
    update();
  }

  void setTextFieldHeight(value) {
    height = value;
    update();
  }

  void setTextFieldPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
