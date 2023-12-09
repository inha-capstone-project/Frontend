import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inha_capstone_project_byoa/pages/byoa_pages/responsive.dart';
import 'package:inha_capstone_project_byoa/pages/login/login_page.dart';
import 'package:inha_capstone_project_byoa/pages/post_page.dart';

import 'data/getx/common/list_controller_getx.dart';
import 'pages/login/register_page.dart';
import 'pages/post_page2.dart';

void main() async {
  Get.put(GetxListController());
  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/byoa', page: () => BYOA()),
        GetPage(name: '/post', page: () => PostPage()),
        GetPage(name: '/post2', page: () => PostPage2()),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
