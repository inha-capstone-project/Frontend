import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import '../getx/11.media_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/11.media_properties.dart';

class MediaPlayerTemplate extends StatelessWidget {
  MediaPlayerTemplate({Key? key}) : super(key: key);

  final GetxYoutubeController youtubeController = Get.put(GetxYoutubeController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    final String tag = youtubeController.hashCode.toString();

    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(MediaPlayerProperties(tag: tag));
      },
      child: GetBuilder<GetxYoutubeController>(
        init: youtubeController,
        tag: tag,
        builder: (_) {
          return Padding(
            padding: _.padding,
            child: SizedBox(
              width: 500,
              height: 300,
              child: PodVideoPlayer(
                controller: Get.find<GetxYoutubeController>(tag: tag).controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
