import 'package:flutter/material.dart';
import '../common/images.dart';

List<Draggable> layoutElements = [
  Draggable(
    data: 'container_row',
    feedback: Image.asset(containerRowIcon, width: 50),
    child: _builderContainer(Icons.arrow_right_alt_rounded, 'Row'),
  ),
  Draggable(
    data: 'container_column',
    feedback: Image.asset(containerColumnIcon, width: 50),
    child: _builderContainer(Icons.arrow_downward_rounded, 'Column'),
  ),
  Draggable(
    data: 'divider',
    feedback: Image.asset(dividerIcon, width: 50),
    child: _builderContainer(Icons.linear_scale_outlined, 'Divider'),
  ),
];

List<Draggable> baseElements = [
  Draggable(
    data: 'text',
    feedback: Image.asset(textIcon, width: 50),
    child: _builderContainer(Icons.text_fields_rounded, 'Text'),
  ),
  Draggable(
    data: 'image',
    feedback: Image.asset(imageIcon, width: 50),
    child: _builderContainer(Icons.image_outlined, 'Image'),
  ),
  Draggable(
    data: 'button',
    feedback: Image.asset(buttonIcon, width: 50),
    child: _builderContainer(Icons.ads_click_rounded, 'Button'),
  ),
  Draggable(
    data: 'icon',
    feedback: Image.asset(iconIcon, width: 50),
    child: _builderContainer(Icons.emoji_emotions_outlined, 'Icon'),
  ),
  Draggable(
    data: 'listTile',
    feedback: Image.asset(listTileIcon, width: 50),
    child: _builderContainer(Icons.list_alt_rounded, 'ListTile'),
  ),
  Draggable(
    data: 'checkBox',
    feedback: Image.asset(checkBoxIcon, width: 50),
    child: _builderContainer(Icons.check_box_outlined, 'CheckBox'),
  ),
  Draggable(
    data: 'media',
    feedback: Image.asset(videoIcon, width: 50),
    child: _builderContainer(Icons.video_library_sharp, 'Video'),
  ),
];

List<Draggable> formElements = [
  Draggable(
    data: 'textField',
    feedback: Image.asset(textFieldIcon, width: 50),
    child: _builderContainer(Icons.article_outlined, 'TextField'),
  ),
  Draggable(
    data: 'radioButton',
    feedback: Image.asset(radioButtonIcon, width: 50),
    child: _builderContainer(Icons.checklist_rounded, 'RadioButton'),
  ),
];

List<Draggable> exampleElements = [
  Draggable(
    data: 'calculator',
    feedback: Image.asset(calculatorIcon, width: 50),
    child: _builderContainer(Icons.calculate_rounded, 'Calculator'),
  ),
  Draggable(
    data: 'snack',
    feedback: Image.asset(calculatorIcon, width: 50),
    child: _builderContainer(Icons.gamepad_rounded, 'Snack Game'),
  ),
];

Widget _builderContainer(IconData icon, String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //arrow_right_alt_rounded
        Icon(
          icon,
          color: Colors.white,
          size: 60,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
