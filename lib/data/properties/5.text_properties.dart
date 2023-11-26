import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/5.text_controller_getx.dart';

class TextProperties extends StatelessWidget {
  const TextProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieSubHeaderText('Text properties'),
        divider(),
        propertieSubHeaderText('Title'),
        strTextField(
          hintText: '내용을 입력하세요',
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextTitle(value);
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextTitle('');
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Font Size'),
        numTextField(
          hintText: '16',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextFontSize(value);
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextFontSize(16.0);
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Font Weight'),

        // ** 왜인지는 모르겠으나 GetBuilder를 사용하면 자꾸 오류가 발생함 //
        DropdownButton(
          style: TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
          value: Get.find<GetxTextController>(tag: tag).selectedValue,
          items: valueList
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            Get.find<GetxTextController>(tag: tag).changeTextFontWeight(value);
          },
        ),
        divider(),
        propertieSubHeaderText('Color'),
        SizedBox(height: 10),
        pickColor(onColorChanged: (value) {
          Get.find<GetxTextController>(tag: tag).changeTextColor(value);
        }),
        divider(),
        propertieSubHeaderText('패딩 설정 (top, bottom, left, right)'),
        numTextField(
          hintText: 'top',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(top: double.parse(value));
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(top: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'bottom',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(bottom: double.parse(value));
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(bottom: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'left',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(left: double.parse(value));
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(left: 0.0);
            }
          },
        ),
        numTextField(
          hintText: 'right',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(right: double.parse(value));
            } catch (e) {
              Get.find<GetxTextController>(tag: tag).changeTextPadding(right: 0.0);
            }
          },
        ),
      ],
    );
  }
}
