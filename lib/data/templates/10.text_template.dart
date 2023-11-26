import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/5.text_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/5.text_properties.dart';

class TextTemplate extends StatelessWidget {
  TextTemplate({Key? key}) : super(key: key);

  final GetxTextController textController = Get.put(GetxTextController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = textController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(TextProperties(tag: tag));
      },
      child: GetBuilder<GetxTextController>(
        init: textController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: Text(
              _.title,
              style: TextStyle(
                fontSize: _.fontSize,
                fontWeight: _.fontWeight,
                color: _.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
