import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/4.divider_controller_getx.dart';
import 'common/func_properties.dart';

class DivierProperties extends StatelessWidget {
  final String tag;
  const DivierProperties({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('Divider 설정'),
        divider(),
        propertieSubHeaderText('Thickness'),
        numTextField(
          hintText: '3',
          maxLength: 1,
          onChanged: (value) {
            try {
              Get.find<GetxDividerController>(tag: tag).setDividerThickness(double.parse(value));
            } catch (e) {
              Get.find<GetxDividerController>(tag: tag).setDividerThickness(1.0);
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Color'),
        SizedBox(height: 10),
        pickColor(onColorChanged: (value) {
          Get.find<GetxDividerController>(tag: tag).setDividerColor(value);
        }),
        divider(),
        propertieSubHeaderText('패딩 설정 (top, bottom, left, right)'),
        numTextField(
          hintText: 'top',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(top: double.parse(value));
            } catch (e) {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(top: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'bottom',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(bottom: double.parse(value));
            } catch (e) {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(bottom: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'left',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(left: double.parse(value));
            } catch (e) {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(left: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'right',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(right: double.parse(value));
            } catch (e) {
              Get.find<GetxDividerController>(tag: tag).setDividerPadding(right: 0.0);
            }
          },
        ),
        divider(),
      ],
    );
  }
}
