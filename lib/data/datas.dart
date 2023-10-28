import 'package:flutter/material.dart';
import 'package:inha_capstone_project_byoa/data/provider.dart';
import 'package:inha_capstone_project_byoa/screens/login_pages/login_screen.dart';
import 'package:provider/provider.dart';

// 모바일화면에 배치된 모든 위젯을이 List에 전부 저장됨
List<Widget> widgetList = [];
// 각 템플릿의 id값들
int key = 0;
// 텍스트필드 높이 값
double valueHeight = 0;
// 텍스트필드 가로 값
double valueWidth = 0;
// ColorPicker로 지정한 컬러 값
Color valueColor = Color(0xFFFFFFFF);

Widget containerTemplate() {
  return DragTarget(
    builder: (context, candidateData, rejectedData) {
      return Container(
        color: Provider.of<Properties>(context).color,
        width: Provider.of<Properties>(context).width,
        height: Provider.of<Properties>(context).height,
      );
    },
  );
}

Widget buttonTemplate({required int index}) {
  return ElevatedButton(
    key: Key(index.toString()),
    onPressed: () {},
    child: Text('Button'),
  );
}

Widget dividerTemplate({required int index}) {
  return Divider(
    color: Colors.black,
    thickness: 3.0,
    key: Key(
      index.toString(),
    ),
  );
}

Widget textTemplate({required int index, required String title}) {
  return Text(
    key: Key(
      index.toString(),
    ),
    title,
  );
}

Widget imageTemplate({required int index, required String url}) {
  return Image.network(
    url,
    key: Key(
      index.toString(),
    ),
  );
}

Widget iconTemplate({required int index}) {
  return Icon(
    Icons.adb,
    key: Key(
      index.toString(),
    ),
  );
}

Widget iconButtonTemplate({required int index, required context}) {
  return IconButton(
    key: Key(index.toString()),
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LoginScreen()));
    },
    icon: Icon(
      Icons.home,
    ),
  );
}

Widget listTileTemplate({required int index}) {
  return ListTile(
    key: Key(index.toString()),
    title: Text('인하대학교 공과대학'),
    subtitle: Text('인천광역시 학익동 64-2'),
    leading: Text('주소'),
    trailing: Icon(Icons.exit_to_app),
  );
}

Widget textFieldTemplate({required int index}) {
  return TextField(
    key: Key(index.toString()),
    decoration: InputDecoration(
      border: InputBorder.none,
      fillColor: Colors.grey[400],
    ),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
}
