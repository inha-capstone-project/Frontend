import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/1.container_controller_getx.dart';
import 'common/func_properties.dart';

class ContainerProperties extends StatelessWidget {
  final String tag;
  const ContainerProperties({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        propertieHeaderText('Container 설정'),
        divider(),
        propertieSubHeaderText('Height'),
        numTextField(
            maxLength: 3,
            hintText: 'Height',
            onChanged: (value) {
              Get.find<GetxContainerController>(tag: tag).changeContainerHeight(value);
            }),
        propertieSubHeaderText('Width'),
        numTextField(
            maxLength: 3,
            hintText: 'Width',
            onChanged: (value) {
              Get.find<GetxContainerController>(tag: tag).changeContainerWidth(value);
            }),
        divider(),
        propertieSubHeaderText('Color'),
        SizedBox(height: 10),
        pickColor(onColorChanged: (value) {
          Get.find<GetxContainerController>(tag: tag).changeContainerColor(value);
        }),
      ],
    );
  }
}
