import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Center propertieHeaderText(title) {
  return Center(child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)));
}

Text propertieSubHeaderText(title) {
  return Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18));
}

Divider divider() {
  return Divider(color: Colors.white, thickness: 2.0, height: 40);
}

Padding numTextField({required String hintText, required int maxLength, required Function(String) onChanged}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextField(
      onChanged: onChanged,
      //
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      maxLength: maxLength, // 최대 입력받은 수 만큼 입력 가능
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))], // 0-9 의 숫자만 입력되도록 필터링
      cursorColor: Colors.black,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green[50],
        counterStyle: TextStyle(color: Colors.white),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(6),
        ),
        //
        hintStyle: TextStyle(color: Colors.blue.shade400, fontWeight: FontWeight.w500),
        hintText: hintText,
      ),
    ),
  );
}

Padding strTextField({required String hintText, required Function(String) onChanged}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextField(
      onChanged: onChanged,
      //
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.multiline,
      maxLength: null,
      cursorColor: Colors.black,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green[50],
        counterStyle: TextStyle(color: Colors.white),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(6),
        ),
        //
        hintStyle: TextStyle(color: Colors.blue.shade400, fontWeight: FontWeight.w500),
        hintText: hintText,
      ),
    ),
  );
}

Padding pickColor({required Function(Color) onColorChanged}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: ColorPicker(
      onColorChanged: onColorChanged,
      //
      pickerColor: Colors.red,
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
  );
}

// GetBuilder dropDownButton(var func) {
//   return GetBuilder<GetxTextController>(
//     builder: (_) {
//       return DropdownButton(
//         style: TextStyle(color: Colors.white),
//         dropdownColor: Colors.black,
//         value: Get.find<GetxTextController>().selectedValue,
//         items: valueList
//             .map(
//               (e) => DropdownMenuItem(
//                 value: e,
//                 child: Text(e),
//               ),
//             )
//             .toList(),
//         onChanged: (value) {
//           func(value);
//         },
//       );
//     },
//   );
// }