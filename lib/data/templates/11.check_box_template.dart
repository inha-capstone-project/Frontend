import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx/10.check_box_controller_getx.dart';
import 'package:inha_capstone_project_byoa/data/getx/common/screen_controller_getx.dart';

import '../properties/10.check_box_properties.dart';

class CheckBoxTemplate extends StatefulWidget {
  CheckBoxTemplate({Key? key}) : super(key: key);

  @override
  State<CheckBoxTemplate> createState() => _CheckBoxTemplateState();
}

class _CheckBoxTemplateState extends State<CheckBoxTemplate> {
  final GetxCheckBoxController textController = Get.put(GetxCheckBoxController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = textController.hashCode.toString();

    bool isChecked = true;

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(CheckBoxProperties(tag: tag));
      },
      child: GetBuilder<GetxCheckBoxController>(
        init: textController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: AbsorbPointer(
              child: Checkbox(
                value: isChecked, // isChecked 부분을 나중에 ._isCheck로 바꿔야 함 (GetxCheckBoxController에 있는 값으로 실기간 변동되게)
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
