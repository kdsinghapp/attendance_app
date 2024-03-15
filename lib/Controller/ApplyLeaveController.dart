
import 'package:attendance_app/apis/api_models/add_leave_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';
class ApplyLeaveController extends GetxController{
  RxBool showProgressBar=false.obs;
  RxInt dateLength=0.obs;
  TextEditingController reasonController=TextEditingController();
  List<DateTime?> dates=[DateTime.now()];
  Map<String, dynamic> bodyParamsForAddLeaveForm = {};
  AddLeaveModel? addLeaveModel;
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
  changeProgressBar(bool value){
    showProgressBar.value=value;
  }

  changeDateLength(){
    dateLength.value=dates.length;
  }


  Future<void> callingAddAttendanceForm() async {
    bodyParamsForAddLeaveForm = {
      ApiKeyConstants.userId: userModel!.userData!.id,
      ApiKeyConstants.leaveFromDate:dates[0].toString().substring(0,10),
      ApiKeyConstants.leaveToDate:dateLength.value==2?dates[dateLength.value-1].toString().substring(0,10):dates[0].toString().substring(0,10),
      ApiKeyConstants.reason:reasonController.text.toString(),
    };
    print("bodyParamsForAddLeave:::::$bodyParamsForAddLeaveForm");
    addLeaveModel = await ApiMethods.addLeaveApi(
        bodyParams: bodyParamsForAddLeaveForm);
    if (addLeaveModel!.status!="0"??false ) {
      changeProgressBar(false);
      print("Add Leave  Successfully complete....");
    }else{
      print("Add Leave  Failed....");
      showToastMessage(addLeaveModel!.message!);
      changeProgressBar(false);
    }
  }


}