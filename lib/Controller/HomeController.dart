
import 'package:attendance_app/Activity/NotificationListActivity.dart';
import 'package:attendance_app/common/mylocation.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {
  RxInt count=0.obs;
  RxBool showCheckInOutBtn=true.obs;
  RxBool showLoadingBar=false.obs;
  RxBool showProgressbar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String>icon=[IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,];
  List<String>type=['Check In','Tea Break','Check In','Tea Break',];
  List<String>time=['10:00 am','10:00 am','10:00 am','10:00 am',];


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


  changeCheckInOutBtn(){
    showCheckInOutBtn.value=!showCheckInOutBtn.value;
  }
  changeShowLoadingBar(bool value){
    showLoadingBar.value=value;
  }
  changeChangeGpsStatus(bool value){
    gpsStatus.value=value;
  }

  openClubAllEventActivity(String clubId,String clubName){
    Map<String,String> data={
      'clubId':clubId,
      'clubName':clubName
    };
    Get.toNamed('/clubAllEventActivity',parameters:data );
  }

  openNotificationListActivity(){
    Get.to(()=> const NotificationListActivity());
  }



  Future<void> checkGPSStatus(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Location permissions are permanently denied.'),
      //   ),
      // );
      print('permanently denied');
    } else {
      bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (isLocationServiceEnabled) {
        print('GPS enable...');
      } else {
        print('GPS disable...');
      }
    }
  }


   void  checkGpsStatus() async{
     final value= await MyLocation.getCurrentLocation(context :Get.context!);
     changeCheckInOutBtn();

   }


}