import 'package:attendance_app/Activity/TypingActivity.dart';
import 'package:attendance_app/apis/api_models/get_leavestatus_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';

class LeaveStatusController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  RxBool presentData=true.obs;
  Map<String, dynamic> bodyParamsForGetLeaveStatus = {};
  GetLeaveStatusModel? getLeaveStatusModel;
  UserModel? userModel;

  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
    callingAddAttendanceForm();

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
  changePresentData(bool value){
    presentData.value=value;
  }

  void callingAddAttendanceForm() async {
    bodyParamsForGetLeaveStatus = {
      ApiKeyConstants.userId: userModel!.userData!.id,
    };
    print("bodyParamsForGetLeaveStatus:::::$bodyParamsForGetLeaveStatus");
    getLeaveStatusModel = await ApiMethods.getLeaveStatusApi(
        bodyParams: bodyParamsForGetLeaveStatus);
    if (getLeaveStatusModel!.status!="0"??false ) {
      changeShowProgressBar(false);
      print("Get Leave List Successfully complete....");
    }else{
      print("Get Leave List  Failed....");
      showToastMessage(getLeaveStatusModel!.message!);
      changePresentData(false);
    }
  }


}