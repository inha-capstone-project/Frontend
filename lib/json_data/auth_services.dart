import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inha_capstone_project_byoa/common/flutter_toast.dart';
import 'login.dart';

Future<void> createUser(String id, String password, String nickname, context) async {
  const String apiUrl = 'http://43.201.254.2:52493/signUp';

  try {
    // JSON 형태의 요청 본문을 준비
    final body = json.encode(
      {
        'id': id,
        'password': password,
        'nickname': nickname,
      },
    );

    // HTTP POST 요청 보내기
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    // 요청에 성공했다면 응답을 확인
    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.of(context).pop();
      Get.offAndToNamed('/');
      flutterToast('회원가입 완료!', '#00b09b', '#96c93d');
    } else if (response.statusCode == 409) {
      Navigator.of(context).pop();
      flutterToast('이미 가입된 아이디 입니다.', '#ffa500', '#ffa500');
    } else {
      Navigator.of(context).pop();
      flutterToast('모든 사항을 기입해주세요.', '#dc1c13', '#dc1c13');
    }
  } catch (e) {
    Navigator.of(context).pop();
    Fluttertoast.showToast(msg: '서버에 오류가 있습니다. 잠시 후 다시 시도해주세요.');
    print(e.toString());
  }
}

Future<List<dynamic>> getInfo(String id, String password, context) async {
  const String apiUrl = 'http://43.201.254.2:52493/login';
  try {
    final body = json.encode(
      {
        'id': id,
        'password': password,
      },
    );

    // HTTP POST 요청 보내기
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      final Login result = loginFromJson(utf8.decode(response.bodyBytes));
      return [result.result.nickname, result.result.token.accessToken, result.result.userId, result.result.id];
    } else {
      Navigator.of(context).pop();
      return List.empty();
    }
  } catch (e) {
    print(e);
    return List.empty();
  }
}
