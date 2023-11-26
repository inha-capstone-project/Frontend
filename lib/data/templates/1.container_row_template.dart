import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/templates/11.check_box_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/13.text_filed_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/14.radio_button_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/2.container_column_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/6.image_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/7.button_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/8.icon_template.dart';
import 'package:inha_capstone_project_byoa/data/templates/9.list_tile_template.dart';
import '../getx/1.container_controller_getx.dart';
import '../getx/common/screen_controller_getx.dart';
import '../properties/1.container_properties.dart';
import '10.text_template.dart';
import '12.media_template.dart';
import '3.divider_template.dart';

class ContainerRowTemplate extends StatefulWidget {
  ContainerRowTemplate({Key? key}) : super(key: key);

  @override
  State<ContainerRowTemplate> createState() => _ContainerRowTemplateState();
}

class _ContainerRowTemplateState extends State<ContainerRowTemplate> {
  final GetxContainerController containerController = Get.put(GetxContainerController(), tag: UniqueKey().toString());

  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    final String tag = containerController.hashCode.toString();
    return GestureDetector(
      onTap: () {
        Get.find<GetxScreenController>().addScreen(ContainerProperties(tag: tag));
      },
      child: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return GetBuilder<GetxContainerController>(
            init: containerController,
            tag: tag,
            builder: (_) {
              return Container(
                width: _.width,
                height: _.height,
                color: _.color,
                child: ReorderableListView(
                  scrollDirection: Axis.horizontal,
                  onReorder: _onReorder,
                  children: List.generate(
                    widgetList.length,
                    (index) {
                      return Container(
                        key: ValueKey('item_$index'), // 각 항목에 고유한 Key 할당
                        child: widgetList[index],
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        onAccept: (data) {
          switch (data) {
            case 'container_row':
              widgetList.add(ContainerRowTemplate());
              break;
            case 'container_column':
              widgetList.add(ContainerColumnTemplate());
              break;
            case 'divider':
              widgetList.add(DividerTemplate());
              break;
            case 'text':
              widgetList.add(TextTemplate());
              break;
            case 'image':
              widgetList.add(ImageTemplate());
              break;
            case 'button':
              widgetList.add(ButtonTemplate());
              break;
            case 'icon':
              widgetList.add(IconTemplate());
              break;
            case 'listTile':
              widgetList.add(ListTileTemplate());
              break;
            case 'checkBox':
              widgetList.add(CheckBoxTemplate());
              break;
            case 'media':
              widgetList.add(MediaPlayerTemplate());
              break;
            case 'textField':
              widgetList.add(TextFiledTemplate());
              break;
            case 'radioButton':
              widgetList.add(RadioButtonTemplate());
              break;
          }
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    Widget item = widgetList.removeAt(oldIndex);
    widgetList.insert(newIndex, item);
    setState(() {});
  }
}
