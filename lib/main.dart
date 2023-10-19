import 'package:flutter/material.dart';
import 'route/route.dart';

void main() {
  runApp(
    MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: route,
    ),
  );
}
