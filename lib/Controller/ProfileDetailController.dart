
import 'package:attendance_app/Activity/EditProfileActivity.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileDetailController extends GetxController {
  TextEditingController searchController=TextEditingController();
  final count=0.obs;
  RxBool showProgressbar=false.obs;
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



}