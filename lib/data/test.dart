import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:inha_capstone_project_byoa/data/datas.dart';
import 'package:inha_capstone_project_byoa/data/provider.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              valueHeight = double.parse(value);
              Provider.of<Properties>(context, listen: false)
                  .changeContainerHeight();
            },
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            // 최대 999까지만 입력 가능
            maxLength: 3,

            // 0-9 의 숫자만 입력되도록 필터링
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
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
              valueWidth = double.parse(value);
              Provider.of<Properties>(context, listen: false)
                  .changeContainerWidth();
            },
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            // 최대 999까지만 입력 가능
            maxLength: 3,
            minLines: 1,
            // 0-9 의 숫자만 입력되도록 필터링
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
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
          pickerColor: Provider.of<Properties>(context).color,
          onColorChanged: (value) {
            valueColor = value;
            Provider.of<Properties>(context,listen: false).changeContainerColor();
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
}
