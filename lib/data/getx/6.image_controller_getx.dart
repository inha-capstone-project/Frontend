import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxImageController extends GetxController {
  String url = 'https://monthly.chosun.com/up_fd/Mdaily/2017-09/bimg_thumb/2017042000056_0.jpg';
  double width = 100;
  double height = 100;

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
