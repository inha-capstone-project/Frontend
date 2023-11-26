import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/4.divider_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/4.divider_properties.dart';

class DividerTemplate extends StatelessWidget {
  DividerTemplate({Key? key}) : super(key: key);
  final GetxDividerController dividerController = Get.put(GetxDividerController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = dividerController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(DivierProperties(tag: tag));
      },
      child: GetBuilder<GetxDividerController>(
        init: dividerController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: Divider(
              color: _.color,
              thickness: _.thickness,
            ),
          );
        },
      ),
    );
  }
}
