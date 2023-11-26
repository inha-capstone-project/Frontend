import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/12.text_field_controller_getx.dart';

class TextFieldProperties extends StatelessWidget {
  const TextFieldProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('TextField properties'),
        divider(),
        propertieSubHeaderText('TextField Padding'),
        numTextField(hintText: 'top', maxLength: 3, onChanged: (value) => Get.find<GetxTextFieldController>(tag: tag).setTextFieldPadding(top: double.parse(value))),
        numTextField(hintText: 'bottom', maxLength: 3, onChanged: (value) => Get.find<GetxTextFieldController>(tag: tag).setTextFieldPadding(bottom: double.parse(value))),
        numTextField(hintText: 'left', maxLength: 3, onChanged: (value) => Get.find<GetxTextFieldController>(tag: tag).setTextFieldPadding(left: double.parse(value))),
        numTextField(hintText: 'right', maxLength: 3, onChanged: (value) => Get.find<GetxTextFieldController>(tag: tag).setTextFieldPadding(right: double.parse(value))),
      ],
    );
  }
}
