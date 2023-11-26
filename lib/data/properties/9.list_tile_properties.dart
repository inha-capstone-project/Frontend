import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/9.list_tile_controller_getx.dart';

class ListTileProperties extends StatelessWidget {
  const ListTileProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('ListTile properties'),
        divider(),
        propertieSubHeaderText('ListTile Leading Text'),
        strTextField(hintText: 'Input Leading Text', onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setLeadingText(value)),
        SizedBox(height: 10),
        propertieSubHeaderText('ListTile Trailing Text'),
        strTextField(hintText: 'Input Trailing Text', onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setTrailingText(value)),
        SizedBox(height: 10),
        propertieSubHeaderText('ListTile Leading & Trailing FontSize'),
        numTextField(hintText: '14', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setLeadingAndTrailingFontSize(double.parse(value))),
        propertieSubHeaderText('ListTile Leading Color'),
        pickColor(onColorChanged: (color) => Get.find<GetxListTileController>(tag: tag).setLeadingAndTrailingFontColor(color)),
        divider(),
        propertieSubHeaderText('ListTile Title Text'),
        strTextField(hintText: 'Input Title Text', onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setTitleText(value)),
        SizedBox(height: 10),
        propertieSubHeaderText('ListTile Title FontSize'),
        numTextField(hintText: '14', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setTitleFontSize(double.parse(value))),
        propertieSubHeaderText('ListTile SubTitle Text'),
        strTextField(hintText: 'Input SubTitle Text', onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setSubTitleText(value)),
        SizedBox(height: 10),
        propertieSubHeaderText('ListTile Title Color'),
        pickColor(onColorChanged: (color) => Get.find<GetxListTileController>(tag: tag).setTitleFontColor(color)),
        divider(),
        propertieSubHeaderText('ListTile Padding'),
        numTextField(hintText: 'top', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setListTilePadding(top: double.parse(value))),
        numTextField(hintText: 'bottom', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setListTilePadding(bottom: double.parse(value))),
        numTextField(hintText: 'left', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setListTilePadding(left: double.parse(value))),
        numTextField(hintText: 'right', maxLength: 3, onChanged: (value) => Get.find<GetxListTileController>(tag: tag).setListTilePadding(right: double.parse(value))),
      ],
    );
  }
}
