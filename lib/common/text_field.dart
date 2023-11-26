import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  TextFieldWidget({
    super.key,
    required this.text,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      maxLines: 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          //borderSide: BorderSide.none, Outline 실선 제거
        ),
        labelText: text,
        fillColor: Colors.grey[200], // 배경색
        filled: true, // 배경색 적용 유무
      ),
    );
  }
}
