import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxListTileController extends GetxController {
  Text leading = Text('Leading');
  Text title = Text('Title');
  Text subTitle = Text('SubTitle');
  Text trailing = Text('Trailing');
  double titleFontSize = 16;
  Color titleFontColor = Colors.black;
  double leadingAndTrailingFontSize = 14;
  Color leadingAndTrailingFontColor = Colors.black;

  EdgeInsets padding = EdgeInsets.zero;

  void setLeadingText(value) {
    leading = Text(value);
    update();
  }

  void setTitleText(value) {
    title = Text(value);
    update();
  }

  void setSubTitleText(value) {
    subTitle = Text(value);
    update();
  }

  void setTrailingText(value) {
    trailing = Text(value);
    update();
  }

  void setTitleFontSize(value) {
    titleFontSize = double.parse(value);
    update();
  }

  void setTitleFontColor(value) {
    titleFontColor = value;
    update();
  }

  void setLeadingAndTrailingFontSize(value) {
    leadingAndTrailingFontSize = double.parse(value);
    update();
  }

  void setLeadingAndTrailingFontColor(value) {
    leadingAndTrailingFontColor = value;
    update();
  }

  void setListTilePadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
