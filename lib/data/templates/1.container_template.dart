import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/1.container_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/1.container_properties.dart';

class ContainerRowTemplate extends StatelessWidget {
  ContainerRowTemplate({Key? key}) : super(key: key);

  final GetxContainerController containerController = Get.put(GetxContainerController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = containerController.hashCode.toString();
    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(ContainerProperties(tag: tag));
      },
      child: GetBuilder<GetxContainerController>(
        init: containerController,
        tag: tag,
        builder: (_) {
          return Container(
            width: _.width,
            height: _.height,
            color: _.color,
          );
        },
      ),
    );
  }
}
