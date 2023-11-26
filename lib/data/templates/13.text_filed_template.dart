import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/12.text_field_properties.dart';

import '../getx/12.text_field_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';

class TextFiledTemplate extends StatelessWidget {
  TextFiledTemplate({super.key});

  final GetxTextFieldController youtubeController = Get.put(GetxTextFieldController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = youtubeController.hashCode.toString();
    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(TextFieldProperties(tag: tag));
      },
      child: GetBuilder<GetxTextFieldController>(
        init: youtubeController,
        tag: tag,
        builder: (_) => Padding(
          padding: _.padding,
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  //borderSide: BorderSide.none, Outline 실선 제거
                ),
                labelText: 'TextField',
                fillColor: Colors.grey[200], // 배경색
                filled: true, // 배경색 적용 유무
              ),
            ),
          ),
        ),
      ),
    );
  }
}
