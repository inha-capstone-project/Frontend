import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxCheckBoxController extends GetxController {
  EdgeInsets padding = EdgeInsets.zero;

  void setCheckBoxPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}