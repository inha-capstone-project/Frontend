import 'package:flutter/material.dart';
import 'package:inha_capstone_project_byoa/screens/login_pages/login_screen.dart';

// 모바일화면에 배치된 모든 위젯을이 List에 전부 저장됨
List<Widget> widgetList = [];
// 각 템플릿의 id값들
int key = 0;
Widget empty = Container();
bool isTrue = false;

Widget containerTemplate({required int index, required Widget child}) {
  return DragTarget(
    key: Key(
      index.toString(),
    ),
    builder: (context, candidateData, rejectedData) {
      return Container(
        color: Colors.amber,
        height: 100,
        child: empty == Container() ? Text('hello') : empty,
      );
    },
    onAccept: (data) {
      if (data == 7) {
        empty = Image.network(
            'https://scsgozneamae10236445.cdn.ntruss.com/data2/content/image/2021/08/29/.cache/512/202108291158953.jpg');
      }
      if (data == 6) {
        empty = Text('테스트 텍스트 입니다. 이 텍스트는 Container의 자식 입니다.');
      }
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
