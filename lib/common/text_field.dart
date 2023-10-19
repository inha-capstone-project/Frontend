import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final bool obscureText;
  TextFieldWidget({
    super.key,
    required this.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 1,
        //maxLength: 10,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        obscureText: obscureText, // 비밀번호 텍스트 유무
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0), // 텍스트필드 OutLine 둥글게
            borderSide: BorderSide.none, // 텍스트 밑줄 제거
          ),
          labelText: text,
          fillColor: Colors.grey[200], // 배경색
          filled: true, // 배경색 적용 유무
        ),
      ),
    );
  }
}
