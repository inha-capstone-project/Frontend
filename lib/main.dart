import 'package:flutter/material.dart';
import 'route/route.dart';

void main() {
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: route,
    ),
  );
}
