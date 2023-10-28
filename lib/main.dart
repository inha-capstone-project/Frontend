import 'package:flutter/material.dart';
import 'package:inha_capstone_project_byoa/data/provider.dart';
import 'package:provider/provider.dart';
import 'route/route.dart';

void main() {
  runApp(
    // 상태관리를 위해 Provider 사용
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Properties(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: route,
      ),
    ),
  );
}
