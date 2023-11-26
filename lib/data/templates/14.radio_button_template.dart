import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/13.radio_button_controller.dart';

class RadioButtonTemplate extends StatefulWidget {
  RadioButtonTemplate({super.key});

  @override
  State<RadioButtonTemplate> createState() => _RadioButtonTemplateState();
}

class _RadioButtonTemplateState extends State<RadioButtonTemplate> {
  final GetxRadioButtonController radioButtonController = Get.put(GetxRadioButtonController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = radioButtonController.hashCode.toString();

    return GestureDetector(
      onTap: () {},
      child: GetBuilder<GetxRadioButtonController>(
        init: radioButtonController,
        tag: tag,
        builder: (_) => Padding(
          padding: _.padding,
          child: Radio(
            value: null,
            groupValue: null,
            onChanged: (value) {
              setState(() {
                // 함수 추가
              });
            },
          ),
        ),
      ),
    );
  }
}
