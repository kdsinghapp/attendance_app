import 'package:attendance_app/Tool/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Activity/LoginActivity.dart';
import 'Activity/MainActivity.dart';
import 'Activity/SplashActivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: '/loginActivity', page: ()=>const LoginActivity()),
        GetPage(name: '/mainActivity', page: ()=>const MainActivity()),
      ],
      theme:Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: const SplashActivity(title: 'Splash Activity'),
    );
  }
}
