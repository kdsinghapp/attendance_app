
import 'package:attendance_app/Activity/AttendanceDetailActivity.dart';
import 'package:attendance_app/apis/api_models/today_attendance_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:get/get.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';



class AttendanceController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  RxBool presentData=true.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<DateTime?> selectDates=[];
  Map<String, dynamic> bodyParamsForTodayAttendanceList = {};
  TodayAttendanceModel? todayAttendanceModel;
  UserModel? userModel;
  RxString monthValue = 'Monthly'.obs;



  changeSelectedDates(List<DateTime?> modelDates){
    selectDates=modelDates;
  }

  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
   callingTodayAttendanceForm();

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

  changeMonthValueStatus(String month){
    monthValue.value=month;
    openAttendanceDetailActivity();
  }
  openAttendanceDetailActivity(){
    int dateLength=selectDates.length;
    Map<String,String> data={
      'from_date':selectDates[0].toString().substring(0,10),
      'to_date':dateLength==1?selectDates[0].toString().substring(0,10):selectDates[dateLength-1].toString().substring(0,10)
    };
    Get.toNamed('/attendanceDetailActivity',parameters: data);
  }

  void callingTodayAttendanceForm() async {
    bodyParamsForTodayAttendanceList = {
      ApiKeyConstants.userId: userModel!.userData!.id,
    };
    print("bodyParamsForTodayAttendance:::::$bodyParamsForTodayAttendanceList");
    todayAttendanceModel = await ApiMethods.getTodayAttendanceList(
        bodyParams: bodyParamsForTodayAttendanceList);
    if (todayAttendanceModel!.status!="0"??false ) {
      changeShowProgressBar(false);
      print("Get Leave List Successfully complete....");
    }else{
      print("Get Leave List  Failed....");
      showToastMessage(todayAttendanceModel!.message!);
      changePresentData(false);
    }
  }


}