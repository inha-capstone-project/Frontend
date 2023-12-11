import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxButtonController extends GetxController {
  String title = 'Click';
  Color backgroundColor = Colors.black;
  Color foregroundColor = Colors.blue;
  double elevation = 30.0;
  double width = 60;
  double height = 40;

  EdgeInsets padding = EdgeInsets.zero;

  void setButtonTitle(value) {
    title = value;
    update();
  }

  void setButtonBackGroundColor(value) {
    backgroundColor = value;
    update();
  }

  void setButtonForeGroundColor(value) {
    foregroundColor = value;
    update();
  }

  void setButtonElevation(value) {
    elevation = value;
    update();
  }

  void setButtonWidth(value) {
    width = value;
    update();
  }

  void setButtonHeight(value) {
    height = value;
    update();
  }

  void setButtonPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
