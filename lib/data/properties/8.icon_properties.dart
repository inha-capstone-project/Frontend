import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/8.icon_controller_getx.dart';

class IconProperties extends StatelessWidget {
  const IconProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('Icon properties'),
        divider(),
        propertieSubHeaderText('Chage Icon'),
        _buildIconPickerButton(context),
        divider(),
        propertieSubHeaderText('Icon Size'),
        numTextField(hintText: '30', maxLength: 3, onChanged: (value) => Get.find<GetxIconController>(tag: tag).setIconSize(double.parse(value))),
        divider(),
        pickColor(onColorChanged: (color) => Get.find<GetxIconController>(tag: tag).setIconColor(color)),
        divider(),
        propertieSubHeaderText('Icon Padding'),
        numTextField(hintText: 'top', maxLength: 3, onChanged: (value) => Get.find<GetxIconController>(tag: tag).setIconPadding(top: double.parse(value))),
        numTextField(hintText: 'bottom', maxLength: 3, onChanged: (value) => Get.find<GetxIconController>(tag: tag).setIconPadding(bottom: double.parse(value))),
        numTextField(hintText: 'left', maxLength: 3, onChanged: (value) => Get.find<GetxIconController>(tag: tag).setIconPadding(left: double.parse(value))),
        numTextField(hintText: 'right', maxLength: 3, onChanged: (value) => Get.find<GetxIconController>(tag: tag).setIconPadding(right: double.parse(value))),
      ],
    );
  }

  Widget _buildIconPickerButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () => _pickIcon(context),
        child: Text('Open IconPicker'),
      ),
    );
  }

  Future<void> _pickIcon(BuildContext context) async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context, iconPackModes: [IconPack.cupertino]);
    Get.find<GetxIconController>(tag: tag).setIcon(icon);
    debugPrint('Picked Icon:  $icon');
  }
}
