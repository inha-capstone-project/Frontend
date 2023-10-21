import 'package:flutter/material.dart';
import '../common/images.dart';

List<Draggable> layoutElements = [
  Draggable(
    data: 0,
    feedback: Image.asset(containerIcon, width: 50),
    child: Image.asset(containerIcon),
  ),
  Draggable(
    data: 1,
    feedback: Image.asset(columnIcon, width: 50),
    child: Image.asset(columnIcon),
  ),
  Draggable(
    data: 2,
    feedback: Image.asset(rowIcon, width: 50),
    child: Image.asset(rowIcon),
  ),
  Draggable(
    data: 3,
    feedback: Image.asset(listViewIcon, width: 50),
    child: Image.asset(listViewIcon),
  ),
  Draggable(
    data: 4,
    feedback: Image.asset(gridViewIcon, width: 50),
    child: Image.asset(gridViewIcon),
  ),
  Draggable(
    data: 5,
    feedback: Image.asset(dividerIcon, width: 50),
    child: Image.asset(dividerIcon),
  ),
];

List<Draggable> baseElements = [
  Draggable(
    data: 6,
    feedback: Image.asset(textIcon, width: 50),
    child: Image.asset(textIcon),
  ),
  Draggable(
    data: 7,
    feedback: Image.asset(imageIcon, width: 50),
    child: Image.asset(imageIcon),
  ),
  Draggable(
    data: 8,
    feedback: Image.asset(buttonIcon, width: 50),
    child: Image.asset(buttonIcon),
  ),
  Draggable(
    data: 9,
    feedback: Image.asset(iconIcon, width: 50),
    child: Image.asset(iconIcon),
  ),
  Draggable(
    data: 10,
    feedback: Image.asset(iconButtonIcon, width: 50),
    child: Image.asset(iconButtonIcon),
  ),
  Draggable(
    data: 11,
    feedback: Image.asset(listTileIcon, width: 50),
    child: Image.asset(listTileIcon),
  ),
  Draggable(
    data: 12,
    feedback: Image.asset(calendarIcon, width: 50),
    child: Image.asset(calendarIcon),
  ),
  Draggable(
    data: 13,
    feedback: Image.asset(checkBoxIcon, width: 50),
    child: Image.asset(checkBoxIcon),
  ),
  Draggable(
    data: 14,
    feedback: Image.asset(playerIcon, width: 50),
    child: Image.asset(playerIcon),
  ),
];
List<Draggable> formElements = [
  Draggable(
    data: 15,
    feedback: Image.asset(textFieldIcon, width: 50),
    child: Image.asset(textFieldIcon),
  ),
  Draggable(
    data: 16,
    feedback: Image.asset(radioButtonIcon, width: 50),
    child: Image.asset(radioButtonIcon),
  ),
];
