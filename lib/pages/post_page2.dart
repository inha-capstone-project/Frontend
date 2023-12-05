import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:inha_capstone_project_byoa/common/text_field.dart';
import 'package:dio/dio.dart' as dioo;
import '../common/data_info.dart';

import 'dart:html' as html;
import 'dart:convert';

class PostPage2 extends StatefulWidget {
  PostPage2({super.key});

  @override
  State<PostPage2> createState() => _PostPage2State();
}

class _PostPage2State extends State<PostPage2> {
  final Uint8List? imageBytes = Get.arguments;
  Uint8List? _selectedImageBytes;

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // 로딩 상태를 추적하는 변수
    return Scaffold(
      body: Stack(
        children: [
          isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      const SizedBox(height: 8.0),
                      Text('서버에 데이터 값을 저장하고 있습니다...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 3, child: Center(child: Image.memory(imageBytes ?? Uint8List(0)))),
                      // Expanded(flex: 2, child: Center(child: Image.network('https://picsum.photos/1080/720'))),
                      const SizedBox(width: 30),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title', style: TextStyle(fontSize: 20)),
                              TextFieldWidget(
                                text: '',
                                controller: titleController,
                              ),
                              sizedbox(),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _pickImage();
                                    },
                                    child: Text('Banner Image'),
                                  ),
                                  //
                                  if (_selectedImageBytes != null) SizedBox(width: 290, height: 290, child: Image.memory(_selectedImageBytes ?? Uint8List(0))),
                                ],
                              ),
                              //
                              sizedbox(),
                              //
                              Text('SubTitle', style: TextStyle(fontSize: 20)),
                              TextFieldWidget(
                                text: '',
                                controller: subTitleController,
                              ),
                              //
                              sizedbox(),
                              //
                              Text('Description', style: TextStyle(fontSize: 20)),
                              TextFieldWidget(
                                text: '',
                                controller: descriptionController,
                              ),
                              //
                              sizedbox(),
                              //
                              Text('Category', style: TextStyle(fontSize: 20)),
                              TextFieldWidget(
                                text: '',
                                controller: categoryController,
                              ),
                              //
                              sizedbox(),
                              //
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      if (imageBytes != null) {
                                        // print(imageBytes);
                                        await uploadImage(imageBytes).then((statusCode) {
                                          if (statusCode == 200) {
                                            Get.toNamed('/byoa');
                                            Fluttertoast.showToast(msg: '서버에 업로드 완료! 모바일 화면에서 확인해주세요');
                                          }
                                        });
                                      } else {
                                        Navigator.of(context).pop();
                                        Fluttertoast.showToast(msg: '서버 업로드 실패. 다시 시도 해주세요');
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: Text('Upload', style: TextStyle(fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  SizedBox sizedbox() {
    return const SizedBox(height: 15);
  }

  void _pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final file = files.first;
        final reader = html.FileReader();
        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((e) {
          _setImage(reader.result as String);
        });
      }
    });
  }

  void _setImage(String dataUrl) {
    final UriData data = Uri.parse(dataUrl).data!;
    setState(() {
      _selectedImageBytes = data.contentAsBytes();
      print(_selectedImageBytes);
    });
  }

  Future<dynamic> uploadImage(Uint8List? imageBytes) async {
    var dio = dioo.Dio();
    var uri = 'http://43.201.254.2:52493/application';

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true)); //로그 확인

    dioo.FormData formData = dioo.FormData();

    if (imageBytes != null) {
      // 이미지 파일 추가
      formData.files.add(
        MapEntry(
          'uiImage',
          dioo.MultipartFile.fromBytes(
            imageBytes,
            filename: 'test11.png',
            contentType: MediaType('multipart', 'form-data'),
          ),
        ),
      );
      formData.files.add(
        MapEntry(
          'thumbnailImage',
          dioo.MultipartFile.fromBytes(
            _selectedImageBytes!,
            filename: 'test12.png',
            contentType: MediaType('multipart', 'form-data'),
          ),
        ),
      );
      // formData.files.add(MapEntry(
      //   'thumbnailImage',
      //   dioo.MultipartFile.fromBytes(
      //     imageBytes,
      //     filename: 'image2.png',
      //     contentType: MediaType('multipart', 'form-data'),
      //   ),
      // ));

      // JSON 데이터를 MultipartFile로 변환하여 추가

      // 이 부분도 contentType: MediaType('application', 'json'),으로 해서 보내
      // 줘야 했음 아니면 application/octet-stream 이렇게 요청이가서 문제 발생하더라 ...ㅠㅠ
      String jsonEncodedData = json.encode({
        "title": titleController.text.toString(),
        "subTitle": subTitleController.text.toString(),
        "description": descriptionController.text.toString(),
        "category": categoryController.text.toString(),
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
          return response.statusCode;
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
          return response.statusCode;
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image to upload.');
    }
  }
}
