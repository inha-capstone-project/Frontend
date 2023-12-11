import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx/10.check_box_controller_getx.dart';

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

    return GetBuilder<GetxCheckBoxController>(
      init: textController,
      tag: tag,
      builder: (_) {
        return Material(
          child: Checkbox(
            value: _.isChecked,
            onChanged: (value) {
              _.change(value);
            },
          ),
        );
      },
    );
  }
}
