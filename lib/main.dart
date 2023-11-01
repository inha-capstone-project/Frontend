import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx_controller.dart';
import 'route/route.dart';

void main() {
  Get.put(GetxListController());
  Get.put(GetxDividerController());
  Get.put(GetxTextController());
  Get.put(GetxImageController());
  Get.put(GetxButtonController());
  Get.put(GetxIconController());
  Get.put(GetxIconButtonController());
  Get.put(GetxListTileController());
  Get.put(GetxCheckBoxController());
  Get.put(GetxYoutubeController());

  runApp(
    // 상태관리를 위해 Provider 사용
    MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}
