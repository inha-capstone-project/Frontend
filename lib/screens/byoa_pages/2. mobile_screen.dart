import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx_controller.dart';
import '../../data/datas.dart';
import '../../data/test.dart';

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
                  final item = Get.find<GetxListController>()
                      .widgetList
                      .removeAt(oldIndex);
                  Get.find<GetxListController>()
                      .widgetList
                      .insert(newIndex, item);
                },
              );
            },
          );
        },
        // 받아온 데이터를 어떻게 처리할 것인가 부분
        onAccept: (int data) {
          setState(
            () {
              // 각 케이스로 0 ~ n 까지의 값들을 처리
              switch (data) {
                // Container
                case 0:
                  Get.find<GetxListController>().widgetList.add(
                        // 컨네이너가 모바일 화면에 추가됐을시 마우스로 클릭시 상태창 띄우기 위하여 제스처디텍터 사용
                        GestureDetector(
                          key: Key(key.toString()),
                          child: containerTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              containerProperties(
                                Get.find<GetxListController>()
                                    .widgetList[key - 1]
                                    .key,
                              ),
                            );
                          },
                        ),
                      );
                // Divider
                case 5:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: dividerTemplate(),
                          onTap: () =>
                              Get.find<GetxScreenController>().addScreen(
                            dividerProperties(),
                          ),
                        ),
                      );
                case 6:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: textTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              textProperties(),
                            );
                          },
                        ),
                      );
                case 7:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: imageTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              imageProperties(),
                            );
                          },
                        ),
                      );
                case 8:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: buttonTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              buttonProperties(),
                            );
                          },
                        ),
                      );
                case 9:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: iconTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              iconProperties(context),
                            );
                          },
                        ),
                      );
                case 10:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: iconButtonTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              iconButtonProperties(context),
                            );
                          },
                        ),
                      );
                case 11:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: listTileTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              listTileProperties(),
                            );
                          },
                        ),
                      );
                case 13:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: checkBoxTemplate(),
                          onTap: () {},
                        ),
                      );
                case 14:
                  Get.find<GetxListController>().widgetList.add(
                        GestureDetector(
                          key: Key(key.toString()),
                          child: youtubeTemplate(),
                          onTap: () {
                            Get.find<GetxScreenController>().addScreen(
                              youtubeProperties(),
                            );
                          },
                        ),
                      );
              }
              key += 1;
            },
          );
        },
      ),
    );
  }
}
