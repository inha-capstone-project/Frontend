import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxTextController extends GetxController {
  String selectedValue = 'FontWeight.w600';
  String title = 'Hello World!';
  double fontSize = 16.0;
  FontWeight fontWeight = FontWeight.w600;
  Color color = Colors.black;
  EdgeInsets padding = EdgeInsets.zero;

  void changeTextFontWeightValue(value) {
    selectedValue = value;
    update();
  }

  void changeTextTitle(value) {
    title = value;
    update();
  }

  void changeTextFontSize(value) {
    fontSize = double.parse(value);
    update();
  }

  changeTextFontWeight(String? value) {
    if (value == 'FontWeight.w100') fontWeight = FontWeight.w100;
    if (value == 'FontWeight.w200') fontWeight = FontWeight.w200;
    if (value == 'FontWeight.w300') fontWeight = FontWeight.w300;
    if (value == 'FontWeight.w400') fontWeight = FontWeight.w400;
    if (value == 'FontWeight.w500') fontWeight = FontWeight.w500;
    if (value == 'FontWeight.w600') fontWeight = FontWeight.w600;
    if (value == 'FontWeight.w700') fontWeight = FontWeight.w700;
    if (value == 'FontWeight.w800') fontWeight = FontWeight.w800;
    if (value == 'FontWeight.w900') fontWeight = FontWeight.w900;
    update();
    return fontWeight;
  }

  void changeTextColor(value) {
    color = value;
    update();
  }

  void changeTextPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
