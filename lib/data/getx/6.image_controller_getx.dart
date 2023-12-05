import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxImageController extends GetxController {
  String url = 'https://picsum.photos/150/150?random';
  double width = 150;
  double height = 150;

  EdgeInsets padding = EdgeInsets.zero;

  void setImageUrl(value) {
    url = value;
    update();
  }

  void setImageWidth(value) {
    width = value;
    update();
  }

  void setImageHeight(value) {
    height = value;
    update();
  }

  void setImagePadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
