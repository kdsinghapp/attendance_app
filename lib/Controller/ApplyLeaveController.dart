import 'package:attendance_app/Common/CommonWidget.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/apis/api_models/add_leave_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/get_leavestatus_model.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';

class ApplyLeaveController extends GetxController {
  RxBool showProgressBar = false.obs;
  RxInt dateLength = 0.obs;
  TextEditingController reasonController = TextEditingController();
  List<DateTime?> dates = [DateTime.now()];
  Map<String, dynamic> bodyParamsForAddLeaveForm = {};
  Map<String, dynamic> bodyParamsForGetLeaveStatus = {};
  List<GetLeaveStatusResult> leaveList = [];
  AddLeaveModel? addLeaveModel;
  UserModel? userModel;
  @override
  void onInit() {
    super.onInit();
    userModel = GlobalData.getUserModel();
    callingGetAttendanceForm();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeProgressBar(bool value) {
    showProgressBar.value = value;
  }

  changeDateLength() {
    dateLength.value = dates.length;
  }

  void callingGetAttendanceForm() async {
    bodyParamsForGetLeaveStatus = {
      ApiKeyConstants.userId: userModel!.userData!.id,
    };
    print("bodyParamsForGetLeaveStatus:::::$bodyParamsForGetLeaveStatus");
    GetLeaveStatusModel? getLeaveStatusModel =
        await ApiMethods.getLeaveStatusApi(
            bodyParams: bodyParamsForGetLeaveStatus);
    if (getLeaveStatusModel!.status != "0" ?? false) {
      leaveList = getLeaveStatusModel.result!;
      print("Get Leave List Successfully complete....");
    } else {
      print("Get Leave List  Failed....");
    }
  }

  clickOnLeaveButton() {
    if (dateLength.value == 2) {
      bool exists = leaveList.any((item) =>
          (item.leaveFromDate!.substring(0, 10) ==
                  dates[0].toString().substring(0, 10) &&
              item.leaveToDate!.substring(0, 10) ==
                  dates[1].toString().substring(0, 10)));
      if (exists) {
        showLeaveAlertBox(
            Get.context!, 'Already you apply leave at this date.');
      } else {
        callingAddAttendanceForm();
      }
    } else {
      bool exists = leaveList.any((item) =>
          item.leaveFromDate!.substring(0, 10) ==
          dates[0].toString().substring(0, 10));
      if (exists) {
        showLeaveAlertBox(
            Get.context!, 'Already you apply leave at this date.');
      } else {
        callingAddAttendanceForm();
      }
    }
  }

  Future<void> callingAddAttendanceForm() async {
    changeProgressBar(true);
    bodyParamsForAddLeaveForm = {
      ApiKeyConstants.userId: userModel!.userData!.id,
      ApiKeyConstants.leaveFromDate: dates[0].toString().substring(0, 10),
      ApiKeyConstants.leaveToDate: dateLength.value == 2
          ? dates[dateLength.value - 1].toString().substring(0, 10)
          : dates[0].toString().substring(0, 10),
      ApiKeyConstants.reason: reasonController.text.toString(),
    };
    print("bodyParamsForAddLeave:::::$bodyParamsForAddLeaveForm");
    addLeaveModel =
        await ApiMethods.addLeaveApi(bodyParams: bodyParamsForAddLeaveForm);
    if (addLeaveModel!.status != "0" ?? false) {
      changeProgressBar(false);
      print("Apply Leave  Successfully completed ....");
      showLeaveAlertBox(Get.context!, 'Apply Leave  Successfully completed.');
      callingGetAttendanceForm();
    } else {
      print("Add Leave  Failed....");
      showToastMessage(addLeaveModel!.message!);
      changeProgressBar(false);
    }
  }

  showLeaveAlertBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Center(
              child: Text(
            "Apply Leave Alert",
            style: MyTextStyle.titleStyle20bb,
          )),
          content: Text(
            message,
            style: MyTextStyle.titleStyle16bb,
            textAlign: TextAlign.center,
          ),
          actions: [
            CommonWidget.commonElevatedButton(
                onPressed: () {
                  Get.back();
                },
                text: 'OK',
                borderRadius: 15.px)
          ],
        );
      },
    );
  }
}
