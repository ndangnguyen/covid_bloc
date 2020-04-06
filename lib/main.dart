import 'package:covid/di/get_it_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/home/home_page.dart';

void main() {
  // Set status bar to transparent
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light));
  GetItManager().register();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
