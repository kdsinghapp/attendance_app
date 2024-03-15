import 'dart:async';
import 'dart:convert';

import 'package:attendance_app/apis/api_methods/api_methods.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class SplashController extends GetxController{
  late SharedPreferences sharedPreferences;
  Map<String, dynamic> bodyParamsForGetProfile = {};
  UserModel? userModel;
  @override
  void onInit() {
    super.onInit();
    splashDuration();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  splashDuration() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2),
            () {
      if(sharedPreferences.getString(StringConstants.userData)!=null){
        Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
        if (jsonData!=null) {
          UserModel model= UserModel.fromJson(jsonData);
          callingGetProfileApi(model.userData!.id!);
        }else{
          Get.toNamed('/loginActivity');
        }

      }else{
        Get.toNamed('/loginActivity');
      }
        }
    );
  }




  Future<void> callingGetProfileApi(String userId) async {
    bodyParamsForGetProfile = {
      ApiKeyConstants.userId:userId,
    };
    print("bodyParamsForGetProfile:::::$bodyParamsForGetProfile");
    userModel = await ApiMethods.getProfileApi(
        bodyParams: bodyParamsForGetProfile);
    if (userModel!.status!="0"??false ) {
       GlobalData.setUserModel(userModel!);
       Get.toNamed('/mainActivity');
    }else{
      print("Get Profile Failed....");
      showToastMessage(userModel!.message!);
      Get.toNamed('/loginActivity');
    }
  }

}