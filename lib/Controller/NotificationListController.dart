
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:get/get.dart';

class NotificationListController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  List<String> icon=[IconsConstants.circleProfileIcon,IconsConstants.circleKeyIcon,IconsConstants.circleProfileIcon];
  List<String> list=['You update your profile picture.','Password Changed','You update your profile picture.'];
  List<String> subList=['You just update your profile picture.','You\'ve completed change the password.','You just update your profile picture.'];

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


}