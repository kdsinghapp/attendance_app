
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/SplashController.dart';
import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../main.dart';
class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key, required this.title});
  final String title;

  @override
  State<SplashActivity> createState() => _SplashState();
}

class _SplashState extends State<SplashActivity> {
  SplashController controller=Get.put(SplashController());

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           SizedBox(
             height: 200.px,
             child: Image.asset(ImageConstants.splashImg,fit: BoxFit.fitHeight,),
           )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}