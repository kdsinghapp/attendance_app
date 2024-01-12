import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/stringconstants.dart';


class SplashController extends GetxController{
  late SharedPreferences sharedPreferences;
  @override
  void onInit() {
    super.onInit();
    splashDuration();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  splashDuration() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2),
            () {
      if(sharedPreferences.getString(StringConstants.userData)!=null){
        //Get.toNamed('/mainActivity');
      }else{
        Get.toNamed('/loginActivity');
      }
        }
    );
  }

}