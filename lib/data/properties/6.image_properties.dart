import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/properties/common/func_properties.dart';
import '../getx/6.image_controller_getx.dart';

class ImageProperties extends StatelessWidget {
  const ImageProperties({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertieHeaderText('Image properties'),
        divider(),
        propertieSubHeaderText('Image URL'),
        strTextField(
          hintText: 'https://example.com/image.png',
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImageUrl(value);
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImageUrl('');
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Image Width'),
        numTextField(
          hintText: '100',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImageWidth(double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImageWidth(10);
            }
          },
        ),
        divider(),
        propertieSubHeaderText('Image Height'),
        numTextField(
          hintText: '100',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImageHeight(double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImageHeight(10);
            }
          },
        ),
        divider(),
        propertieSubHeaderText('패딩 설정 (top, bottom, left, right)'),
        numTextField(
          hintText: 'top',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImagePadding(top: double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImagePadding(top: 0);
            }
          },
        ),
        numTextField(
          hintText: 'bottom',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImagePadding(bottom: double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImagePadding(bottom: 0);
            }
          },
        ),
        numTextField(
          hintText: 'left',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImagePadding(left: double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImagePadding(left: 0);
            }
          },
        ),
        numTextField(
          hintText: 'right',
          maxLength: 3,
          onChanged: (value) {
            try {
              Get.find<GetxImageController>(tag: tag).setImagePadding(right: double.parse(value));
            } catch (e) {
              Get.find<GetxImageController>(tag: tag).setImagePadding(right: 0);
            }
          },
        ),
      ],
    );
  }
}
