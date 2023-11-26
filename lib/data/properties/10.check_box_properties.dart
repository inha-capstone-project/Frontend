import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';

import '../getx/10.check_box_controller_getx.dart';

class CheckBoxProperties extends StatelessWidget {
  CheckBoxProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('CheckBox properties'),
        divider(),
        propertieSubHeaderText('CheckBox Padding'),
        numTextField(hintText: 'top', maxLength: 3, onChanged: (value) => Get.find<GetxCheckBoxController>(tag: tag).setCheckBoxPadding(top: double.parse(value))),
        numTextField(hintText: 'bottom', maxLength: 3, onChanged: (value) => Get.find<GetxCheckBoxController>(tag: tag).setCheckBoxPadding(bottom: double.parse(value))),
        numTextField(hintText: 'left', maxLength: 3, onChanged: (value) => Get.find<GetxCheckBoxController>(tag: tag).setCheckBoxPadding(left: double.parse(value))),
        numTextField(hintText: 'right', maxLength: 3, onChanged: (value) => Get.find<GetxCheckBoxController>(tag: tag).setCheckBoxPadding(right: double.parse(value))),
      ],
    );
  }
}
