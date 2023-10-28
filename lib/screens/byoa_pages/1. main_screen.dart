import 'package:flutter/material.dart';

import 'package:inha_capstone_project_byoa/common/color.dart';
import 'package:inha_capstone_project_byoa/common/images.dart';
import 'package:inha_capstone_project_byoa/data/provider.dart';
import 'package:inha_capstone_project_byoa/data/templates.dart';
import 'package:inha_capstone_project_byoa/common/text_style.dart';
import 'package:inha_capstone_project_byoa/screens/byoa_pages/2.%20mobile_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make your own App', style: textStyle1()),
        centerTitle: true,
      ),
      body: Row(
        children: [
          iconBar(),
          VerticalDivider(color: Colors.white, width: 1),
          templateBar(),
          centerMobileScreen(),
          Expanded(
            flex: 6,
            child: Container(
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // OverFlow로 인하여 임시로 싱글차일드스크롤뷰로 감쌈
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Provider.of<Properties>(context).properties,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 이 함수를 통해 title, children 두 인자를 받아 반복해서 동일한 반복되는 GridView 위젯을 반환
  Widget templates(String title, List<Draggable> children) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      initiallyExpanded: true,
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

  Widget centerMobileScreen() {
    double width = 600;
    return Container(
      color: Colors.white,
      width: width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: width / 1.8,
            height: 650,
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

  Widget iconBar() {
    return Expanded(
      flex: 1,
      child: Container(
        color: mainColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                mainIcon,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget templateBar() {
    return Expanded(
      flex: 6,
      child: Container(
        color: mainColor,
        // OverFlow로 인하여 임시로 싱글차일드스크롤뷰로 감쌈
        child: SingleChildScrollView(
          child: Column(
            children: [
              templates('Layout Elements', layoutElements),
              SizedBox(height: 30.0),
              templates('Base Elements', baseElements),
              SizedBox(height: 30.0),
              templates('Form Elements', formElements),
            ],
          ),
        ),
      ),
    );
  }
}
