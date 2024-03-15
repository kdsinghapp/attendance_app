
import 'package:attendance_app/apis/api_models/get_notification_model.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:get/get.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';

class NotificationListController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  RxBool presentData=true.obs;
  List<String> icon=[IconsConstants.circleProfileIcon,IconsConstants.circleKeyIcon,IconsConstants.circleProfileIcon];
  List<String> list=['You update your profile picture.','Password Changed','You update your profile picture.'];
  List<String> subList=['You just update your profile picture.','You\'ve completed change the password.','You just update your profile picture.'];
  Map<String, dynamic> bodyParamsForGetNotificationList = {};
  GetNotificationModel? getNotificationModel;
  UserModel? userModel;
  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
    fetchAllNotification();
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

  void fetchAllNotification() async {
    bodyParamsForGetNotificationList = {
      ApiKeyConstants.userId: userModel!.userData!.id,
    };
    print("bodyParamsForGetNotification:::::$bodyParamsForGetNotificationList");
    getNotificationModel = await ApiMethods.getNotificationApi(
        bodyParams: bodyParamsForGetNotificationList);
    if (getNotificationModel!.status!="0"??false ) {

      changeShowProgressBar(false);
      print("Get Notification List Successfully complete....");
    }else{
      print("Get Notification List  Failed....");
      showToastMessage(getNotificationModel!.message!);
      changePresentData(false);
    }
  }



}