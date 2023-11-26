import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart' as dioo;
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/common/data_info.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class PostPage extends StatefulWidget {
  PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final Uint8List? mobileImage = Get.arguments;
  final key = GlobalKey();
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
      ),
      body: RepaintBoundary(
        key: key,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.memory(mobileImage ?? Uint8List(0)),
            Signature(
              color: Colors.black,
              strokeWidth: 3.0,
              backgroundPainter: null,
              onSign: null,
              key: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          imageBytes = await captureImage();

          print(imageBytes);
          if (imageBytes != null) {
            await uploadImage(imageBytes);
          } else {
            print('imageBytes 는 현재 값이 들어있지 않습니다');
          }

          setState(() {});
        },
      ),
    );
  }

  Future<Uint8List?> captureImage() async {
    double pixelRatio = 1;
    try {
      RenderRepaintBoundary? boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      ui.Image? image = await boundary?.toImage(pixelRatio: pixelRatio);
      ByteData? byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  Future<void> uploadImage(Uint8List? imageBytes) async {
    var dio = dioo.Dio();
    var uri = 'http://43.201.254.2:52493/file';

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true)); //로그 확인

    dioo.FormData formData = dioo.FormData();

    if (imageBytes != null) {
      // 이미지 파일 추가
      formData.files.add(MapEntry(
        'file',
        dioo.MultipartFile.fromBytes(
          imageBytes,
          filename: 'image1.png',
          contentType: MediaType('multipart', 'form-data'),
        ),
      ));

      // JSON 데이터를 MultipartFile로 변환하여 추가

      // 이 부분도 contentType: MediaType('application', 'json'),으로 해서 보내
      // 줘야 했음 아니면 application/octet-stream 이렇게 요청이가서 문제 발생하더라 ...ㅠㅠ
      String jsonEncodedData = json.encode({
        "fileCategory": "IMAGE",
        "applicationId": 1,
        "userId": id,
        "componentId": 1,
      });
      List<int> jsonDataBytes = utf8.encode(jsonEncodedData);
      formData.files.add(MapEntry(
        'info',
        dioo.MultipartFile.fromBytes(
          jsonDataBytes,
          filename: 'info.json', // 임의의 파일 이름
          contentType: MediaType('application', 'json'),
        ),
      ));

      // print('-------------------');
      // print('${formData.files[0].value.filename} / ${formData.files[0].value.length} / ${formData.files[0].value.contentType}');

      try {
        var response = await dio.post(
          uri,
          data: formData,
          options: dioo.Options(
            headers: {
              'Content-Type': 'multipart/form-data;',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200) {
          print('Image uploaded successfully.');
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image to upload.');
    }
  }
}
