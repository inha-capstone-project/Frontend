import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/11.media_controller_getx.dart';

class MediaPlayerProperties extends StatelessWidget {
  const MediaPlayerProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('Youtube properties'),
        divider(),
        propertieSubHeaderText('Youtube url'),
        strTextField(hintText: 'https://youtu.be/example', onChanged: (value) => Get.find<GetxYoutubeController>(tag: tag).setVidoe(value)),
        divider(),
        propertieSubHeaderText('Youtube Padding'),
        numTextField(hintText: 'top', maxLength: 3, onChanged: (value) => Get.find<GetxYoutubeController>(tag: tag).setVideoPadding(top: double.parse(value))),
        numTextField(hintText: 'bottom', maxLength: 3, onChanged: (value) => Get.find<GetxYoutubeController>(tag: tag).setVideoPadding(bottom: double.parse(value))),
        numTextField(hintText: 'left', maxLength: 3, onChanged: (value) => Get.find<GetxYoutubeController>(tag: tag).setVideoPadding(left: double.parse(value))),
        numTextField(hintText: 'right', maxLength: 3, onChanged: (value) => Get.find<GetxYoutubeController>(tag: tag).setVideoPadding(right: double.parse(value))),
      ],
    );
  }
}
