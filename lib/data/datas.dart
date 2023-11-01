import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx_controller.dart';
import 'package:pod_player/pod_player.dart';

// 각 템플릿의 id값들
int key = 0;
final valueList = [
  'FontWeight.w100',
  'FontWeight.w200',
  'FontWeight.w300',
  'FontWeight.w400',
  'FontWeight.w500',
  'FontWeight.w600',
  'FontWeight.w700',
  'FontWeight.w800',
  'FontWeight.w900',
];

// 0번
Widget containerTemplate() {
  return DragTarget(
    builder: (context, candidateData, rejectedData) {
      return GetBuilder<GetxContainerController>(
        init: GetxContainerController(),
        builder: (_) {
          return Container(
            width: Get.find<GetxContainerController>().width,
            height: Get.find<GetxContainerController>().height,
            color: Get.find<GetxContainerController>().color,
          );
        },
      );
    },
  );
}

// 5번
Widget dividerTemplate() {
  return GetBuilder<GetxDividerController>(
    builder: (_) {
      return Divider(
        color: Get.find<GetxDividerController>().color,
        thickness: Get.find<GetxDividerController>().thickness,
      );
    },
  );
}

Widget textTemplate() {
  return GetBuilder<GetxTextController>(
    builder: (_) {
      return Text(
        Get.find<GetxTextController>().title,
        style: TextStyle(
          fontSize: Get.find<GetxTextController>().fontSize,
          fontWeight: Get.find<GetxTextController>().fontWeight,
          color: Get.find<GetxTextController>().color,
        ),
      );
    },
  );
}

Widget imageTemplate() {
  return GetBuilder<GetxImageController>(
    builder: (_) {
      return CachedNetworkImage(
        imageUrl: Get.find<GetxImageController>().url,
        width: Get.find<GetxImageController>().width,
        height: Get.find<GetxImageController>().height,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Column(
          children: [
            Icon(Icons.error),
            Text(
              '이미지 로드 오류',
            ),
          ],
        ),
      );
    },
  );
}

Widget buttonTemplate() {
  return GetBuilder<GetxButtonController>(
    builder: (_) {
      return AbsorbPointer(
        absorbing: true,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(Get.find<GetxButtonController>().width,
                Get.find<GetxButtonController>().height),
            backgroundColor: Get.find<GetxButtonController>().backgroundColor,
            foregroundColor: Get.find<GetxButtonController>().foregroundColor,
            elevation: Get.find<GetxButtonController>().elevation,
          ),
          child: Text(Get.find<GetxButtonController>().title),
        ),
      );
    },
  );
}

Widget iconTemplate() {
  return GetBuilder<GetxIconController>(
    builder: (_) {
      return Icon(
        Get.find<GetxIconController>().icon,
        size: Get.find<GetxIconController>().size,
        color: Get.find<GetxIconController>().color,
      );
    },
  );
}

Widget iconButtonTemplate() {
  return GetBuilder<GetxIconButtonController>(
    builder: (_) {
      return IconButton(
        onPressed: () {},
        icon: Icon(
          Get.find<GetxIconButtonController>().icon,
          size: Get.find<GetxIconButtonController>().size,
          color: Get.find<GetxIconButtonController>().color,
        ),
      );
    },
  );
}

Widget listTileTemplate() {
  return GetBuilder<GetxListTileController>(
    builder: (_) {
      return ListTile(
        leading: Get.find<GetxListTileController>().leading,
        title: Get.find<GetxListTileController>().title,
        subtitle: Get.find<GetxListTileController>().subTitle,
        trailing: Get.find<GetxListTileController>().trailing,
        titleTextStyle: TextStyle(
            color: Get.find<GetxListTileController>().titleFontColor,
            fontSize: Get.find<GetxListTileController>().titleFontSize),
        leadingAndTrailingTextStyle: TextStyle(
          color: Get.find<GetxListTileController>().leadingAndTrailingFontColor,
          fontSize:
              Get.find<GetxListTileController>().leadingAndTrailingFontSize,
        ),
      );
    },
  );
}

Widget checkBoxTemplate() {
  return GetBuilder<GetxCheckBoxController>(
    builder: (_) {
      return Checkbox(
        value: Get.find<GetxCheckBoxController>().isValue,
        onChanged: (value) =>
            Get.find<GetxCheckBoxController>().changeCheckBoxBool(value),
      );
    },
  );
}

Widget youtubeTemplate() {
  return PodVideoPlayer(
    controller: Get.find<GetxYoutubeController>().controller,
  );
}
