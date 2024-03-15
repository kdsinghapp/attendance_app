
import 'dart:async';

import 'package:attendance_app/Activity/AttendanceActivity.dart';
import 'package:attendance_app/Activity/NotificationListActivity.dart';
import 'package:attendance_app/apis/api_models/add_attendence_model.dart';
import 'package:attendance_app/apis/api_models/get_usertimecount_model.dart';
import 'package:attendance_app/apis/api_models/today_attendance_model.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';



class HomeController extends GetxController {
  RxInt count=0.obs;
  RxBool showCheckInOutBtn=true.obs;
  RxBool showLoadingBar=false.obs;
  RxBool showProgressbar=true.obs;
  RxBool presentData=true.obs;
  RxBool gpsStatus=false.obs;
  RxBool timerStart=false.obs;
  RxInt tabIndex=1.obs;
  String tabType='attendence',statusType='checkin',attendanceId='',attendanceHourId='';
  List<String>icon=[IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,];
  List<String>type=['Check In','Tea Break','Check In','Tea Break',];
  List<String>time=['10:00 am','10:00 am','10:00 am','10:00 am',];
  late SharedPreferences sharedPreferences;
  UserModel? userModel;
  GetUserCountTimeModel? getUserCountTimeModel;
  TodayAttendanceModel? todayAttendanceModel;
  Map<String, dynamic> bodyParamsForAddAttendanceForm = {};
  Map<String, dynamic> bodyParamsForTodayAttendance = {};
  Map<String, dynamic> bodyParamsForGetProfile = {};
  Map<String, dynamic> bodyParamsForGetTotalWorkingHours = {};
  AddAttendanceModel? addAttendanceModel;
  RxString workingTime='00:00'.obs;
  RxString printCrTime='00:00 am'.obs;



  changeTabIndex(String type,String status){
    switch(type){
      case 'attendence':{
        if(status=='OFF'){
           tabIndex.value=1;
           changeCheckInOutBtn(true);
           statusType='checkin';
           changeTimerStart(false);
        }else{
          tabIndex.value=2;
          changeCheckInOutBtn(false);
          statusType='checkout';
          changeTimerStart(true);
        }
        tabType='attendence';
      }break;
      case 'lunch':{
        if(status=='OFF'){
          tabIndex.value=3;
          changeCheckInOutBtn(true);
          statusType='checkin';
          changeTimerStart(false);
        }else{
          tabIndex.value=3;
          changeCheckInOutBtn(false);
          statusType='checkout';
          changeTimerStart(true);
        }
        tabType='lunch';
      }break;
      case 'tea_break':{
        if(status=='OFF'){
          tabIndex.value=4;
          changeCheckInOutBtn(true);
          statusType='checkin';
          changeTimerStart(false);
        }else{
          tabIndex.value=4;
          changeCheckInOutBtn(false);
          statusType='checkout';
          changeTimerStart(true);
        }
        tabType='tea_break';
      }break;
    }

  }


  ///Show current time
  void printCurrentTime() {
    DateTime now = DateTime.now();
    printCrTime.value = DateFormat('h:mm a').format(now);
    Timer.periodic(const Duration(seconds: 60), (Timer timer) {
      DateTime now = DateTime.now();
      printCrTime.value = DateFormat('h:mm a').format(now);
    });

  }

  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
    //getDataFromSharedPreference();
    changeTabIndex(userModel!.userData!.checkOutType!,userModel!.userData!.checkInOutStatus!);
    callingTodayAttendanceForm();
    printCurrentTime();
    calculateWorkingHours();
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

  changeCheckInOutBtn(bool value){
    showCheckInOutBtn.value=value;
  }
  changeShowLoadingBar(bool value){
    showLoadingBar.value=value;
  }
  changeChangeGpsStatus(bool value){
    gpsStatus.value=value;
  }
  changeTimerStart(bool value){
    timerStart.value=value;
  }

  openNotificationListActivity(){
    Get.to(()=> const NotificationListActivity());
  }
  openAttendanceActivity(){
    Get.to(()=> const AttendanceActivity());
  }

  calculateWorkingHours(){
    getTotalWorkingHours();
    Timer.periodic(const Duration(seconds: 30), (Timer timer) {
      if(timerStart.value){
        getTotalWorkingHours();
      }

    });
  }
  void getTotalWorkingHours() async{
    bodyParamsForGetTotalWorkingHours = {
      ApiKeyConstants.userId:userModel!.userData!.id,
      ApiKeyConstants.dateTime:getCurrentTime(),
    };
    print("bodyParamsForGetTotalWorkingHours:::::$bodyParamsForGetTotalWorkingHours");
    getUserCountTimeModel = await ApiMethods.getTotalWorkingHoursApi(
        bodyParams: bodyParamsForGetTotalWorkingHours);
    if (getUserCountTimeModel!.status!="0"??false ) {
      workingTime.value=getUserCountTimeModel!.workHour!;
    }else{
      print("Get User Time Count Failed....");
      showToastMessage(getUserCountTimeModel!.message!);
    }
  }


   String getCurrentTime(){
     DateTime now = DateTime.now();
     String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
     return formattedTime;
   }

  String getTodayDate(){
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd').format(now);
    return formattedTime;
  }

  void callingTodayAttendanceForm() async {
    bodyParamsForTodayAttendance = {
      ApiKeyConstants.userId: userModel!.userData!.id,
    };
    print("bodyParamsForTodayAttendance:::::$bodyParamsForTodayAttendance");
    todayAttendanceModel = await ApiMethods.getTodayAttendanceList(
        bodyParams: bodyParamsForTodayAttendance);
    if (todayAttendanceModel!.status!="0"??false ) {
      changeShowProgressBar(false);
      print("Get Today Attendance List Successfully complete....");
    }else{
      print("Get Today Attendance List  Failed....");
      showToastMessage(todayAttendanceModel!.message!);
      changePresentData(false);
    }
  }

  Future<void> callingAddAttendanceForm(String lat,String lon) async {
    /*if((tabType=='attendence'|| tabType=='lunch'|| tabType=='tea_break')  && statusType=='checkin'){
      attendanceId='';
      attendanceHourId='';
    }else{
      getDataFromSharedPreference();
    }  */
    bodyParamsForAddAttendanceForm = {
      ApiKeyConstants.userId: userModel!.userData!.id!,
      ApiKeyConstants.type: tabType,
      ApiKeyConstants.time: getCurrentTime(),
      ApiKeyConstants.date: getTodayDate(),
      ApiKeyConstants.lat: lat,
      ApiKeyConstants.lon: lon,
      ApiKeyConstants.attendanceId:await getDataFromSharedPreference(true),
      ApiKeyConstants.attendanceHourId:await  getDataFromSharedPreference(false),
      ApiKeyConstants.typeStatus:statusType

    };
    print("bodyParamsForAddAttendanceForm:::::$bodyParamsForAddAttendanceForm");

    try{
      addAttendanceModel = await ApiMethods.addAttendanceApi(bodyParams: bodyParamsForAddAttendanceForm);
      if (addAttendanceModel!.status!="0"??false ) {
        showToastMessage(addAttendanceModel!.message!);
        saveDataSharedPreference(addAttendanceModel!.attendenceId!,addAttendanceModel!.attendenceHourId!);
        callingGetProfileApi();
        changeShowProgressBar(true);
        changePresentData(true);
        callingTodayAttendanceForm();
         }else{
        print("Add Attendance Failed....");
        showToastMessage(addAttendanceModel!.message!);
        changeShowLoadingBar(false);
      }
    }catch(e){
      showToastMessage( 'Add $tabType Failed ....' );
      changeShowLoadingBar(false);
    }

  }
  Future<void> callingGetProfileApi() async {
    bodyParamsForGetProfile = {
      ApiKeyConstants.userId:userModel!.userData!.id,
    };
    print("bodyParamsForGetProfile:::::$bodyParamsForGetProfile");
    userModel = await ApiMethods.getProfileApi(
        bodyParams: bodyParamsForGetProfile);
    if (userModel!.status!="0"??false ) {
      GlobalData.setUserModel(userModel!);
     // changeShowLoadingBar(false);
      //onInit();
      changeTabIndex(userModel!.userData!.checkOutType!,userModel!.userData!.checkInOutStatus!);
      changeShowLoadingBar(false);
    }else{
      print("Get Profile Failed....");
      showToastMessage(userModel!.message!);
    }
  }


   void  checkGpsStatus( ) async{
    // final value= await MyLocation.getCurrentLocation(context :Get.context!);
     print("Start $tabType $statusType Process....");

     LocationData _currentPosition;
     Location location = Location();

     if(await location.serviceEnabled()){
       print("Enter .....");
       _currentPosition = await location.getLocation();
       print("Enter1 .....");
       String lat = _currentPosition.latitude.toString();
       String lon = _currentPosition.longitude.toString();
       print("Address:- $lat  , $lon");
       changeShowLoadingBar(true);
       callingAddAttendanceForm(lat,lon);
     }else{
       changeShowLoadingBar(false);
       print("Please enable your gps location ...");
     }
   }
/*  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      print("Position"+ position.toString());
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }  */


  saveDataSharedPreference(String attendanceId,String attendanceHourId ) async{
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString('attendence_id', attendanceId);
    sharedPreferences.setString('attendence_hour_id', attendanceHourId);
    print('Save Data  AttendanceId:-$attendanceId, AttendanceHourId:-$attendanceHourId');
  }
    Future<String> getDataFromSharedPreference(bool id) async {
     sharedPreferences=await SharedPreferences.getInstance();
     if(id){
       print(' Get Saved Data AttendanceId:-');
       return sharedPreferences.getString('attendence_id')??'';
     }else{
       print(' Get Saved Data AttendanceHoursId:-');
       return sharedPreferences.getString('attendence_hour_id')??'';
     }
   }

}