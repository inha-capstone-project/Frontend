import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/7.button_controller_getx.dart';

class ButtonProperties extends StatelessWidget {
  const ButtonProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('Button properties'),
        divider(),
        propertieSubHeaderText('Button Text context'),
        strTextField(hintText: '텍스트를 입력하세요', onChanged: (value) => Get.find<GetxButtonController>(tag: tag).setButtonTitle(value)),
        divider(),
        propertieSubHeaderText('Button Width'),
        numTextField(hintText: '60', maxLength: 3, onChanged: (value) => Get.find<GetxButtonController>(tag: tag).setButtonWidth(double.parse(value))),
        divider(),
        propertieSubHeaderText('Button Height'),
        numTextField(hintText: '40', maxLength: 3, onChanged: (value) => Get.find<GetxButtonController>(tag: tag).setButtonHeight(double.parse(value))),
        divider(),
        propertieSubHeaderText('Button Elevation'),
        numTextField(hintText: '30', maxLength: 3, onChanged: (value) => Get.find<GetxButtonController>(tag: tag).setButtonElevation(double.parse(value))),
        divider(),
        propertieSubHeaderText('Button Background Color'),
        pickColor(onColorChanged: (color) => Get.find<GetxButtonController>(tag: tag).setButtonBackGroundColor(color)),
        divider(),
        propertieSubHeaderText('Button Foreground Color'),
        pickColor(onColorChanged: (color) => Get.find<GetxButtonController>(tag: tag).setButtonForeGroundColor(color)),
      ],
    );
  }
}
