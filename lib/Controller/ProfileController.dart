import 'package:attendance_app/Activity/SettingActivity.dart';
import 'package:attendance_app/Activity/TermCondittionActivity.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Activity/PrivacyPolicyActivity.dart';

class ProfileController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String> list=['My Profile','Settings','Terms & Conditions','Privacy Policy','Log out'];
  List<String> icon=[IconsConstants.myProfileIcon,IconsConstants.settingIcon,IconsConstants.termsIcon,IconsConstants.privacyIcon,IconsConstants.mainLogoutIcon];

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCount(int value){
    count.value=value;
  }

  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }


  openNextPages(int index){
    switch(index){
      case 0:{

      }break;
      case 1:{
       Get.to(()=>const SettingActivity());
      }break;
      case 2:{
       Get.to(()=> const TermConditionActivity());
      }break;
      case 3:{
       Get.to(()=>const PrivacyPolicyActivity());
      }break;
      case 4:{

      }break;
    }
  }


}