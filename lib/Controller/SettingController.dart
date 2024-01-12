
import 'package:attendance_app/Activity/ChangePasswordActivity.dart';
import 'package:attendance_app/Activity/NotificationActivity.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;


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
  openNotificationPage(){
    Get.to(()=> const NotificationActivity());
  }

  openChangePasswordPage(){
    Get.to(()=> const ChangePasswordActivity());
  }


}