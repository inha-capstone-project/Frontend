import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/data/datas.dart';
import 'package:inha_capstone_project_byoa/data/getx_controller.dart';

Widget containerProperties(key) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Container properties',
        style: TextStyle(color: Colors.white),
      ),
      // 2
      Divider(color: Colors.white, thickness: 2.0),
      // 3
      Text('Height', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxContainerController>()
                .changeContainerHeight(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          // 최대 999까지만 입력 가능
          maxLength: 3,

          // 0-9 의 숫자만 입력되도록 필터링
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
      // 4
      Text('Width', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxContainerController>()
                .changeContainerWidth(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          // 최대 999까지만 입력 가능
          maxLength: 3,
          minLines: 1,
          // 0-9 의 숫자만 입력되도록 필터링
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
      // 5
      Divider(color: Colors.white),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxContainerController>().changeContainerColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
      Divider(color: Colors.white),
      ElevatedButton(
        onPressed: () {
          Get.find<GetxListController>().getListRemove(int.parse(key.value));
        },
        child: Text('위젯 삭제(미완성)'),
      ),
    ],
  );
}

Widget dividerProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Divider properties',
        style: TextStyle(color: Colors.white),
      ),
      // 2
      Divider(color: Colors.white, thickness: 2.0),
      Text('Thickness', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxDividerController>()
                .changeDividerThickness(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          // 최대 999까지만 입력 가능
          maxLength: 3,

          // 0-9 의 숫자만 입력되도록 필터링
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '10',
          ),
        ),
      ),
      Divider(color: Colors.white),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxDividerController>().changeDividerColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
    ],
  );
}

Widget textProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Text properties',
        style: TextStyle(color: Colors.white),
      ),
      // 2
      Divider(color: Colors.white, thickness: 2.0),
      Text('Title', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxTextController>().changeTextTitle(value);
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.multiline,
          maxLines: null,

          // 최대 999까지만 입력 가능

          // 0-9 의 숫자만 입력되도록 필터링
          //inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '텍스트를 입력하세요.',
          ),
        ),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('Font size', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxTextController>()
                .changeTextFontSize(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,

          // 최대 999까지만 입력 가능

          // 0-9 의 숫자만 입력되도록 필터링
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '16',
          ),
        ),
      ),
      Divider(color: Colors.white),
      GetBuilder<GetxTextController>(
        builder: (_) {
          return DropdownButton(
            style: TextStyle(color: Colors.white),
            dropdownColor: Colors.black,
            value: Get.find<GetxTextController>().selectedValue,
            items: valueList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (value) {
              Get.find<GetxTextController>().selectedValue =
                  Get.find<GetxTextController>().changeTextFontWeight(value);
            },
          );
        },
      ),
      Divider(color: Colors.white),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxTextController>().changeTextColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
    ],
  );
}

Widget imageProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Image properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('Image URL', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxImageController>().changeImageUrl(value);
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'http://example.com/example.png',
          ),
        ),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('Image Width', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxImageController>()
                .changeImageWidth(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
      Divider(color: Colors.white),
      Text('Image Height', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxImageController>()
                .changeImageHeight(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
    ],
  );
}

Widget buttonProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Button properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('Button Text context', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxButtonController>().changeButtonTitle(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '텍스트를 입력하세요.',
          ),
        ),
      ),
      Divider(color: Colors.white),
      Text('Button Width', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxButtonController>()
                .changeButtonWidth(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
      Divider(color: Colors.white),
      Text('Button Height', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxButtonController>()
                .changeButtonHeight(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '100',
          ),
        ),
      ),
      Divider(color: Colors.white),
      Text('Button Elevation', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxButtonController>()
                .changeButtonElevation(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '30',
          ),
        ),
      ),
      Divider(color: Colors.white),
      Text('Button Background Color', style: TextStyle(color: Colors.white)),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxButtonController>().changeButtonBackGroundColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
      Divider(color: Colors.white),
      Text('Button Foreground Color', style: TextStyle(color: Colors.white)),
      ColorPicker(
        pickerColor: Colors.blue,
        onColorChanged: (value) {
          Get.find<GetxButtonController>().changeButtonForeGroundColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
    ],
  );
}

Widget iconProperties(context) {
  // ignore: no_leading_underscores_for_local_identifiers
  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    Get.find<GetxIconController>().changeIcon(icon);

    debugPrint('Picked Icon:  $icon');
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Icon properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      ElevatedButton(
        onPressed: _pickIcon,
        child: Text('Open IconPicker'),
      ),
      Divider(color: Colors.white),
      Text('Icon Size', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxIconController>().changeIconSize(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '30',
          ),
        ),
      ),
      Divider(color: Colors.white),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxIconController>().changeIconColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
    ],
  );
}

Widget iconButtonProperties(context) {
  // ignore: no_leading_underscores_for_local_identifiers
  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    Get.find<GetxIconController>().changeIcon(icon);

    debugPrint('Picked Icon:  $icon');
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'IconButton properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      ElevatedButton(
        onPressed: _pickIcon,
        child: Text('Open IconButtonPicker'),
      ),
      Divider(color: Colors.white),
      Text('IconButton Size', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxIconController>().changeIconSize(double.parse(value));
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          maxLength: 3,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '30',
          ),
        ),
      ),
      Divider(color: Colors.white),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxIconController>().changeIconColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
    ],
  );
}

Widget listTileProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'ListTile properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('ListTile Leading Text', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>().changeLeadingText(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Input Leading Text',
          ),
        ),
      ),
      Text('ListTile Leading FontSize', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>()
                .changeLeadingAndTrailingFontSize(value);
          },
          style: TextStyle(color: const Color.fromARGB(255, 93, 73, 73)),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '14',
          ),
        ),
      ),
      Text('ListTile Leading Color', style: TextStyle(color: Colors.white)),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxListTileController>()
              .changeLeadingAndTrailingFontColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
      Divider(color: Colors.white),
      //////////////////////////////////////////////////////////////////////////
      Text('ListTile Title Text', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>().changeTitleText(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Input Title Text',
          ),
        ),
      ),
      Text('ListTile Title FontSize', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>().changeTitleFontSize(value);
          },
          style: TextStyle(color: const Color.fromARGB(255, 93, 73, 73)),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '14',
          ),
        ),
      ),
      Text('ListTile SubTitle Text', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>().changeSubTitleText(value);
          },
          style: TextStyle(color: const Color.fromARGB(255, 93, 73, 73)),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '14',
          ),
        ),
      ),
      Text('ListTile Title Color', style: TextStyle(color: Colors.white)),
      ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {
          Get.find<GetxListTileController>().changeTitleFontColor(value);
        },
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        paletteType: PaletteType.hsvWithHue,
        labelTypes: [],
        pickerAreaBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        portraitOnly: true,
      ),
      Divider(color: Colors.white),
      //////////////////////////////////////////////////////////////////////////
      Text('ListTile Trailing Text', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxListTileController>().changeTrailingText(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            hintText: '텍스트를 입력하세요.',
          ),
        ),
      ),
    ],
  );
}

Widget youtubeProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Youtube properties',
        style: TextStyle(color: Colors.white),
      ),
      Divider(color: Colors.white, thickness: 2.0),
      Text('Youtube link', style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            Get.find<GetxYoutubeController>().changeVidoe(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Enter youtube url/id',
            hintText: 'https://youtu.be/2GHlhxWMcWI',
          ),
        ),
      ),
    ],
  );
}
