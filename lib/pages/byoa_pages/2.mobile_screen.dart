import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/templates/11.check_box_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/14.radio_button_template.dart';

import '../../data/getx/common/list_controller_getx.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build your own app'),
      ),
      // Draggable로 이동된 데이터를 받아주는 함수
      body: DragTarget(
        builder: (context, candidateData, rejectedData) {
          // 위젯을 이동할 수 있도록 하는 위젯
          return ReorderableListView.builder(
            itemBuilder: (context, index) {
              return Get.find<GetxListController>().widgetList[index];
            },
            itemCount: Get.find<GetxListController>().widgetList.length,
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              setState(
                () {
                  final item = Get.find<GetxListController>().widgetList.removeAt(oldIndex);
                  Get.find<GetxListController>().widgetList.insert(newIndex, item);
                },
              );
            },
          );
        },
        // 받아온 데이터를 어떻게 처리할 것인가 부분
        onAccept: (String data) {
          switch (data) {
            case 'container_row':
              Get.find<GetxListController>().widgetList.add(ContainerRowTemplate(key: UniqueKey()));
              break;
            case 'container_column':
              Get.find<GetxListController>().widgetList.add(ContainerColumnTemplate(key: UniqueKey()));
              break;
            case 'divider':
              Get.find<GetxListController>().widgetList.add(DividerTemplate(key: UniqueKey()));
              break;
            case 'text':
              Get.find<GetxListController>().widgetList.add(TextTemplate(key: UniqueKey()));
              break;
            case 'image':
              Get.find<GetxListController>().widgetList.add(ImageTemplate(key: UniqueKey()));
              break;
            case 'button':
              Get.find<GetxListController>().widgetList.add(ButtonTemplate(key: UniqueKey()));
              break;
            case 'icon':
              Get.find<GetxListController>().widgetList.add(IconTemplate(key: UniqueKey()));
              break;
            case 'listTile':
              Get.find<GetxListController>().widgetList.add(ListTileTemplate(key: UniqueKey()));
              break;
            case 'checkBox':
              Get.find<GetxListController>().widgetList.add(CheckBoxTemplate(key: UniqueKey()));
              break;
            case 'media':
              Get.find<GetxListController>().widgetList.add(MediaPlayerTemplate(key: UniqueKey()));
              break;
            case 'textField':
              Get.find<GetxListController>().widgetList.add(TextFiledTemplate(key: UniqueKey()));
              break;
            case 'radioButton':
              Get.find<GetxListController>().widgetList.add(RadioButtonTemplate(key: UniqueKey()));
              break;
          }
        },
      ),
    );
  }
}
