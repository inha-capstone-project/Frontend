import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/6.image_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/6.image_properties.dart';

class ImageTemplate extends StatelessWidget {
  ImageTemplate({Key? key}) : super(key: key);
  final GetxImageController imageController = Get.put(GetxImageController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = imageController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(ImageProperties(tag: tag));
      },
      child: GetBuilder<GetxImageController>(
        init: imageController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: CachedNetworkImage(
              imageUrl: _.url,
              width: _.width,
              height: _.height,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text('이미지 로드 오류'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
