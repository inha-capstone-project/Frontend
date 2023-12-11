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
import '../../data/templates/1.container_template.dart';
import '../../data/templates/10.text_template.dart';
import '../../data/templates/12.media_template.dart';
import '../../data/templates/13.text_filed_template.dart';
import '../../data/templates/3.divider_template.dart';
import '../../data/templates/6.image_template.dart';
import '../../data/templates/7.button_template.dart';
import '../../data/templates/8.icon_template.dart';
import '../../data/templates/9.list_tile_template.dart';

// GlobalKey를 사용하여 Stack 위젯의 위치와 크기를 추적합니다.
GlobalKey stackKey = GlobalKey();

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
              return Stack(
                key: stackKey, // Stack에 GlobalKey 할당
                children: _.widgetList.asMap().entries.map((entry) {
                  int index = entry.key;
                  print(index);
                  print(entry.value.toString());
                  Widget widget = entry.value;
                  Offset position = _.widgetPositions[index];
                  return Positioned(
                    left: position.dx,
                    top: position.dy,
                    child: Draggable(
                      data: index.toString(),
                      feedback: widget,
                      onDragEnd: (DraggableDetails dragDetails) {
                        print(dragDetails.offset);

                        // Stack 위젯의 RenderBox를 가져옵니다.
                        RenderBox? renderBox = stackKey.currentContext?.findRenderObject() as RenderBox?;
                        if (renderBox != null) {
                          // Stack 위젯의 전역 위치를 가져옵니다.
                          Offset stackPosition = renderBox.localToGlobal(Offset.zero);

                          // 드래그된 위젯의 전역 좌표에서 Stack의 전역 좌표를 빼서 상대적 위치를 계산합니다.
                          Offset relativePosition = dragDetails.offset - stackPosition;
                          _.updateWidgetPosition(index, relativePosition);
                        }
                      },
                      child: widget,
                    ),
                  );
                }).toList(),
              );
              // return ReorderableListView.builder(
              //   itemBuilder: (context, index) {
              //     return _.widgetList[index];
              //   },
              //   itemCount: _.widgetList.length,
              //   onReorder: (oldIndex, newIndex) {
              //     if (oldIndex < newIndex) {
              //       newIndex -= 1;
              //     }
              //     setState(
              //       () {
              //         final item = _.widgetList.removeAt(oldIndex);
              //         _.widgetList.insert(newIndex, item);
              //       },
              //     );
              //   },
              // );
            },
          );
        },
        // 받아온 데이터를 어떻게 처리할 것인가 부분
        onAccept: (String data) {
          switch (data) {
            case 'container':
              Get.find<GetxListController>().addWidget(ContainerRowTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'divider':
              Get.find<GetxListController>().addWidget(DividerTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'text':
              Get.find<GetxListController>().addWidget(TextTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'image':
              Get.find<GetxListController>().addWidget(ImageTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'button':
              Get.find<GetxListController>().addWidget(ButtonTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'icon':
              Get.find<GetxListController>().addWidget(IconTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'listTile':
              Get.find<GetxListController>().addWidget(ListTileTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'checkBox':
              Get.find<GetxListController>().addWidget(CheckBoxTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'media':
              Get.find<GetxListController>().addWidget(MediaPlayerTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'textField':
              Get.find<GetxListController>().addWidget(TextFiledTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'radioButton':
              Get.find<GetxListController>().addWidget(RadioButtonTemplate(key: UniqueKey()), Offset(0, 0));
              break;
            case 'calculator':
              Get.find<GetxListController>().addWidget(Calculator(key: UniqueKey()), Offset(0, 0));
              break;
            case 'snack':
              Get.find<GetxListController>().addWidget(Snack(key: UniqueKey()), Offset(0, 0));
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
          elevation: 0,
        );
      },
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar의 표준 높이
}
