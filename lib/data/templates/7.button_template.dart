import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/7.button_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/7.button_properties.dart';

class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({Key? key}) : super(key: key);

  final GetxButtonController buttonController = Get.put(GetxButtonController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = buttonController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(ButtonProperties(tag: tag));
      },
      child: GetBuilder<GetxButtonController>(
        init: buttonController,
        tag: tag,
        builder: (_) {
          return AbsorbPointer(
            absorbing: true,
            child: Padding(
              padding: _.padding,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(_.width, _.height),
                  backgroundColor: _.backgroundColor,
                  foregroundColor: _.foregroundColor,
                  elevation: _.elevation,
                ),
                child: Text(Get.find<GetxButtonController>(tag: tag).title),
              ),
            ),
          );
        },
      ),
    );
  }
}
