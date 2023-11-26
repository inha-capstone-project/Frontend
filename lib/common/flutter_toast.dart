import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void flutterToast(String msg, String color1, String color2) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    textColor: Colors.white,
    webBgColor: "linear-gradient(to right, $color1, $color2)",
    webShowClose: true,
    webPosition: 'center',
  );
}
