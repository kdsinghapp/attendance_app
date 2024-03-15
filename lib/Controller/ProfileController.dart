import 'package:attendance_app/Activity/LeaveStatusActivity.dart';
import 'package:attendance_app/Activity/SettingActivity.dart';
import 'package:attendance_app/Activity/TermCondittionActivity.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Activity/EditProfileActivity.dart';
import '../Activity/LogOutActivity.dart';
import '../Activity/PrivacyPolicyActivity.dart';
import '../Activity/ProfileDetailActivity.dart';

class ProfileController extends GetxController {
  TextEditingController searchController=TextEditingController();
  final count=0.obs;
  RxBool showProgressbar=false.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String> list=['My Profile','Leave Status','Settings','Terms & Conditions','Privacy Policy','Log out'];
  List<String> icon=[IconsConstants.myProfileIcon,IconsConstants.termsIcon,IconsConstants.settingIcon,IconsConstants.termsIcon,IconsConstants.privacyIcon,IconsConstants.mainLogoutIcon];
  UserModel? userModel;

  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCount(){
    count.value++;
  }

  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }

  openEditProfile() async{
    await Get.to(()=>const EditProfileActivity());
    userModel=GlobalData.getUserModel();
    changeCount();
  }


  openNextPages(int index){
    switch(index){
      case 0:{
       Get.to(()=> const ProfileDetailActivity());
      }break;
      case 1:{
        Get.to(()=>const LeaveStatusActivity());
      }break;
      case 2:{
       Get.to(()=>const SettingActivity());
      }break;
      case 3:{
       Get.to(()=> const TermConditionActivity());
      }break;
      case 4:{
       Get.to(()=>const PrivacyPolicyActivity());
      }break;
      case 5:{
       Get.to(()=> const LogOutActivity());
      }break;
    }
  }


}