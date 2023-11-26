import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/8.icon_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/8.icon_properties.dart';

class IconTemplate extends StatelessWidget {
  IconTemplate({Key? key}) : super(key: key);

  final GetxIconController iconController = Get.put(GetxIconController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = iconController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(IconProperties(tag: tag));
      },
      child: GetBuilder<GetxIconController>(
        init: iconController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: Icon(
              _.icon,
              size: _.size,
              color: _.color,
            ),
          );
        },
      ),
    );
  }
}
