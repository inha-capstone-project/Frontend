import 'package:flutter/material.dart';
import 'package:inha_capstone_project_byoa/pages/byoa_pages/1.main_screen.dart';
import 'package:inha_capstone_project_byoa/pages/byoa_pages/2.mobile_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.desktopBody,
    required this.mobileBody,
  });

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}

class BYOA extends StatelessWidget {
  const BYOA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        // desktopBody: MainScreen(nickname: Get.arguments[0], token: Get.arguments[1]),
        desktopBody: MainScreen(),
        mobileBody: MobileScreen(),
      ),
    );
  }
}
