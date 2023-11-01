import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class GetxListController extends GetxController {
  // 모바일화면에 배치된 모든 위젯을이 List에 전부 저장됨
  List<Widget> widgetList = [];

  void getListRemove(index) {
    widgetList.removeAt(index);
    update();
  }
}

class GetxScreenController extends GetxController {
  Widget properties = Container();

  void addScreen(value) {
    properties = value;
    update();
  }
}

class GetxContainerController extends GetxController {
  double height = 100;
  double width = 100;
  Color color = Colors.red;

  // 컨네이너 높이 변경
  void changeContainerHeight(value) {
    height = value;
    update();
  }

  // 컨테이너 가로 변경
  void changeContainerWidth(value) {
    width = value;
    update();
  }

  // 컨테이너 색상 변경
  void changeContainerColor(value) {
    color = value;
    update();
  }
}

class GetxDividerController extends GetxController {
  double thickness = 3.0;
  Color color = Colors.black;

  void changeDividerThickness(value) {
    thickness = value;
    update();
  }

  void changeDividerColor(value) {
    color = value;
    update();
  }
}

class GetxTextController extends GetxController {
  var selectedValue = 'FontWeight.w600';
  String title = 'Hello World!';
  double fontSize = 16.0;
  FontWeight fontWeight = FontWeight.w600;
  Color color = Colors.black;

  void changeTextFontWeightValue(value) {
    selectedValue = value;
    update();
  }

  void changeTextTitle(value) {
    title = value;
    update();
  }

  void changeTextFontSize(value) {
    fontSize = value;
    update();
  }

  changeTextFontWeight(String? value) {
    if (value == 'FontWeight.w100') fontWeight = FontWeight.w100;
    if (value == 'FontWeight.w200') fontWeight = FontWeight.w200;
    if (value == 'FontWeight.w300') fontWeight = FontWeight.w300;
    if (value == 'FontWeight.w400') fontWeight = FontWeight.w400;
    if (value == 'FontWeight.w500') fontWeight = FontWeight.w500;
    if (value == 'FontWeight.w600') fontWeight = FontWeight.w600;
    if (value == 'FontWeight.w700') fontWeight = FontWeight.w700;
    if (value == 'FontWeight.w800') fontWeight = FontWeight.w800;
    if (value == 'FontWeight.w900') fontWeight = FontWeight.w900;
    update();
    return value;
  }

  void changeTextColor(value) {
    color = value;
    update();
  }
}

class GetxImageController extends GetxController {
  String url =
      'https://monthly.chosun.com/up_fd/Mdaily/2017-09/bimg_thumb/2017042000056_0.jpg';
  double width = 100;
  double height = 100;

  void changeImageUrl(value) {
    url = value;
    update();
  }

  void changeImageWidth(value) {
    width = value;
    update();
  }

  void changeImageHeight(value) {
    height = value;
    update();
  }
}

class GetxButtonController extends GetxController {
  String title = 'Click';
  Color backgroundColor = Colors.red;
  Color foregroundColor = Colors.blue;
  double elevation = 30.0;
  double width = 100;
  double height = 100;

  void changeButtonTitle(value) {
    title = value;
    update();
  }

  void changeButtonBackGroundColor(value) {
    backgroundColor = value;
    update();
  }

  void changeButtonForeGroundColor(value) {
    foregroundColor = value;
    update();
  }

  void changeButtonElevation(value) {
    elevation = value;
    update();
  }

  void changeButtonWidth(value) {
    width = value;
    update();
  }

  void changeButtonHeight(value) {
    height = value;
    update();
  }
}

class GetxIconController extends GetxController {
  IconData icon = Icons.home;
  double size = 30.0;
  Color color = Colors.red;

  void changeIcon(value) {
    icon = value;
    update();
  }

  void changeIconSize(value) {
    size = value;
    update();
  }

  void changeIconColor(value) {
    color = value;
    update();
  }
}

class GetxIconButtonController extends GetxController {
  IconData icon = Icons.home;
  double size = 30.0;
  Color color = Colors.red;

  void changeIconButton(value) {
    icon = value;
    update();
  }

  void changeIconButtonSize(value) {
    size = value;
    update();
  }

  void changeIconButtonColor(value) {
    color = value;
    update();
  }
}

class GetxListTileController extends GetxController {
  Text leading = Text('Leading');
  Text title = Text('Title');
  Text subTitle = Text('SubTitle');
  Text trailing = Text('Trailing');
  double titleFontSize = 16;
  Color titleFontColor = Colors.black;
  double leadingAndTrailingFontSize = 14;
  Color leadingAndTrailingFontColor = Colors.black;

  void changeLeadingText(value) {
    leading = Text(value);
    update();
  }

  void changeTitleText(value) {
    title = Text(value);
    update();
  }

  void changeSubTitleText(value) {
    subTitle = Text(value);
    update();
  }

  void changeTrailingText(value) {
    trailing = Text(value);
    update();
  }

  void changeTitleFontSize(value) {
    titleFontSize = double.parse(value);
    update();
  }

  void changeTitleFontColor(value) {
    titleFontColor = value;
    update();
  }

  void changeLeadingAndTrailingFontSize(value) {
    leadingAndTrailingFontSize = double.parse(value);
    update();
  }

  void changeLeadingAndTrailingFontColor(value) {
    leadingAndTrailingFontColor = value;
    update();
  }
}

class GetxCheckBoxController extends GetxController {
  bool isValue = false;

  void changeCheckBoxBool(value) {
    isValue = value;
    update();
  }
}

class GetxYoutubeController extends GetxController {
  PodPlayerController controller = PodPlayerController(
    playVideoFrom:
        PlayVideoFrom.youtube('https://youtu.be/2GHlhxWMcWI&t=1060s'),
    podPlayerConfig: PodPlayerConfig(
      videoQualityPriority: [720, 360],
      autoPlay: false,
    ),
  )..initialise();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    update();
  }

  void changeVidoe(value) {
    controller.changeVideo(
      playVideoFrom: PlayVideoFrom.youtube(value),
      playerConfig: PodPlayerConfig(
          autoPlay: false, videoQualityPriority: [1080, 720, 360]),
    );
    update();
  }
}
