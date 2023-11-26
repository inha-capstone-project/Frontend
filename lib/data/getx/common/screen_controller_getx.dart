import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxScreenController extends GetxController {
  Widget properties = Container();

  void addScreen(value) {
    properties = value;
    update();
  }
}
