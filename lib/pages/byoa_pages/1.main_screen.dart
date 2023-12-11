import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart' as dioo;
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/common/color.dart';
import 'package:inha_capstone_project_byoa/common/data_info.dart';
import 'package:inha_capstone_project_byoa/data/getx/common/list_controller_getx.dart';
import 'package:inha_capstone_project_byoa/data/start_draggable_data.dart';
import 'package:inha_capstone_project_byoa/common/text_style.dart';
import 'package:inha_capstone_project_byoa/pages/byoa_pages/2.mobile_screen.dart';
import 'package:http_parser/http_parser.dart';
import '../../data/getx/common/screen_controller_getx.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final key = GlobalKey();
  Uint8List? imageBytes;
  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'Make your own App',
          style: appBarTS(),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                userId.isNotEmpty ? '유저 ID : $userId' : '로그인 되지 않음',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_alt_rounded, size: 50),
        onPressed: () async {
          imageBytes = await captureImage();
          Get.toNamed('/post', arguments: imageBytes);
          print(imageBytes);
          setState(() {});
        },
      ),
      body: Row(
        children: [
          templateBar(),
          SizedBox(
            width: 800,
            child: Scaffold(
              body: RepaintBoundary(key: key, child: CenterScreen()),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.find<GetxListController>().getListRemove();
                },
                child: Text('최근\n위젯\n삭제'),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: double.infinity,
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // OverFlow로 인하여 임시로 싱글차일드스크롤뷰로 감쌈
                child: GetBuilder<GetxScreenController>(
                  init: GetxScreenController(),
                  builder: (_) {
                    return SingleChildScrollView(
                      child: Get.find<GetxScreenController>().properties,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 이 함수를 통해 title, children 두 인자를 받아 반복해서 동일한 반복되는 GridView 위젯을 반환
  Widget templates(String title, List<Draggable> children, bool isTrue) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      initiallyExpanded: isTrue,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      children: [
        GridView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 12.0,
            maxCrossAxisExtent: 100,
            crossAxisSpacing: 20.0,
          ),
          children: children,
        ),
      ],
    );
  }

  Widget templateBar() {
    return Expanded(
      flex: 6,
      child: Container(
        height: double.infinity,
        color: mainColor,
        // OverFlow로 인하여 임시로 싱글차일드스크롤뷰로 감쌈
        child: SingleChildScrollView(
          child: Column(
            children: [
              templates('Layout Elements', layoutElements, true),
              SizedBox(height: 30.0),
              templates('Base Elements', baseElements, true),
              SizedBox(height: 30.0),
              templates('Form Elements', formElements, true),
              SizedBox(height: 30.0),
              Divider(color: Colors.white),
              // **************************************************** //
              templates('Example', exampleElements, false),
            ],
          ),
        ),
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

class CenterScreen extends StatelessWidget {
  const CenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 530,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 7.0,
              ),
            ),
            child: MobileScreen(),
          ),
        ),
      ),
    );
  }
}
