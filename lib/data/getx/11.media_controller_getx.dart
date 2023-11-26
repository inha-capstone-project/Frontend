import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class GetxYoutubeController extends GetxController {
  EdgeInsets padding = EdgeInsets.zero;

  PodPlayerController controller = PodPlayerController(
    playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/2GHlhxWMcWI&t=1060s'),
    podPlayerConfig: PodPlayerConfig(
      videoQualityPriority: [720, 360],
      autoPlay: false,
    ),
  )..initialise();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    update();
  }

  void setVidoe(value) {
    controller.changeVideo(
      playVideoFrom: PlayVideoFrom.youtube(value),
      playerConfig: PodPlayerConfig(autoPlay: false, videoQualityPriority: [1080, 720, 360]),
    );
    update();
  }

  void setVideoPadding({double? top, double? bottom, double? left, double? right}) {
    padding = EdgeInsets.only(
      top: top ?? padding.top,
      bottom: bottom ?? padding.bottom,
      left: left ?? padding.left,
      right: right ?? padding.right,
    );
    update();
  }
}
