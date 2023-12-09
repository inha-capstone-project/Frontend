import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx/0.%20appbar_controller_getx.dart';
import 'package:inha_capstone_project_byoa/data/properties/0.%20appbar_properties.dart';
import 'package:inha_capstone_project_byoa/data/templates/11.check_box_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/14.radio_button_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/example/calculator.dart';
import 'package:inha_capstone_project_byoa/data/templates/example/snack.dart';

import '../../data/getx/common/list_controller_getx.dart';
import '../../data/getx/common/screen_controller_getx.dart';
import '../../data/templates/1.container_row_template.dart';
import '../../data/templates/13.text_filed_template.dart';
import '../../data/templates/2.container_column_template.dart';
import '../../data/templates/12.media_template.dart';
import '../../data/templates/3.divider_template.dart';
import '../../data/templates/10.text_template.dart';
import '../../data/templates/6.image_template.dart';
import '../../data/templates/7.button_template.dart';
import '../../data/templates/8.icon_template.dart';
import '../../data/templates/9.list_tile_template.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(GetxAppBarController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      // Draggable로 이동된 데이터를 받아주는 함수
      body: DragTarget(
        builder: (context, candidateData, rejectedData) {
          // 위젯을 이동할 수 있도록 하는 위젯
          return GetBuilder<GetxListController>(
            builder: (_) {
              return ReorderableListView.builder(
                itemBuilder: (context, index) {
                  return _.widgetList[index];
                },
                itemCount: _.widgetList.length,
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  setState(
                    () {
                      final item = _.widgetList.removeAt(oldIndex);
                      _.widgetList.insert(newIndex, item);
                    },
                  );
                },
              );
            },
          );
        },
        // 받아온 데이터를 어떻게 처리할 것인가 부분
        onAccept: (String data) {
          switch (data) {
            case 'container_row':
              Get.find<GetxListController>().addWidget(ContainerRowTemplate(key: UniqueKey()));
              break;
            case 'container_column':
              Get.find<GetxListController>().addWidget(ContainerColumnTemplate(key: UniqueKey()));
              break;
            case 'divider':
              Get.find<GetxListController>().addWidget(DividerTemplate(key: UniqueKey()));
              break;
            case 'text':
              Get.find<GetxListController>().addWidget(TextTemplate(key: UniqueKey()));
              break;
            case 'image':
              Get.find<GetxListController>().addWidget(ImageTemplate(key: UniqueKey()));
              break;
            case 'button':
              Get.find<GetxListController>().addWidget(ButtonTemplate(key: UniqueKey()));
              break;
            case 'icon':
              Get.find<GetxListController>().addWidget(IconTemplate(key: UniqueKey()));
              break;
            case 'listTile':
              Get.find<GetxListController>().addWidget(ListTileTemplate(key: UniqueKey()));
              break;
            case 'checkBox':
              Get.find<GetxListController>().addWidget(CheckBoxTemplate(key: UniqueKey()));
              break;
            case 'media':
              Get.find<GetxListController>().addWidget(MediaPlayerTemplate(key: UniqueKey()));
              break;
            case 'textField':
              Get.find<GetxListController>().addWidget(TextFiledTemplate(key: UniqueKey()));
              break;
            case 'radioButton':
              Get.find<GetxListController>().addWidget(RadioButtonTemplate(key: UniqueKey()));
              break;
            case 'calculator':
              Get.find<GetxListController>().addWidget(Calculator(key: UniqueKey()));
              break;
            case 'snack':
              Get.find<GetxListController>().addWidget(Snack(key: UniqueKey()));
              break;
          }
        },
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Get.find<GetxScreenController>().addScreen(AppBarProperties());
    }, child: GetBuilder<GetxAppBarController>(
      builder: (_) {
        return AppBar(
          title: Text(Get.find<GetxAppBarController>().text),
          backgroundColor: Get.find<GetxAppBarController>().color,
        );
      },
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar의 표준 높이
}
