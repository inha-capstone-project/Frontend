import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/9.list_tile_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/9.list_tile_properties.dart';

class ListTileTemplate extends StatelessWidget {
  ListTileTemplate({Key? key}) : super(key: key);

  final GetxListTileController listTileController = Get.put(GetxListTileController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = listTileController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(ListTileProperties(tag: tag));
      },
      child: GetBuilder<GetxListTileController>(
        init: listTileController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: ListTile(
              leading: _.leading,
              title: _.title,
              subtitle: _.subTitle,
              trailing: _.trailing,
              titleTextStyle: TextStyle(color: _.titleFontColor, fontSize: _.titleFontSize),
              leadingAndTrailingTextStyle: TextStyle(
                color: _.leadingAndTrailingFontColor,
                fontSize: _.leadingAndTrailingFontSize,
              ),
            ),
          );
        },
      ),
    );
  }
}
