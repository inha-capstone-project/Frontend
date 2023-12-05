import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/getx/0.%20appbar_controller_getx.dart';

import 'common/func_properties.dart';

class AppBarProperties extends StatelessWidget {
  const AppBarProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('AppBar 설정'),
        divider(),
        strTextField(
          hintText: 'Title',
          onChanged: (value) {
            try {
              Get.find<GetxAppBarController>().setAppBarTitle(value);
            } catch (e) {
              Get.find<GetxAppBarController>().setAppBarTitle('');
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Color'),
        SizedBox(height: 10),
        pickColor(onColorChanged: (value) {
          Get.find<GetxAppBarController>().setAppBarColor(value);
        }),
      ],
    );
  }
}
