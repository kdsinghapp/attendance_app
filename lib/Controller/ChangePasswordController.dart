import 'package:attendance_app/apis/api_models/change_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';


class ChangePasswordController extends GetxController{
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  TextEditingController currentPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();

  FocusNode focusCurrentPassword = FocusNode();
  FocusNode focusNewPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();

  final isCurrentPassword = false.obs;
  final isNewPassword = false.obs;
  final isCnfPassword = false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitChangePasswordForm = {};
  UserModel? userModel;
  ChangePasswordModel? changePasswordModel;

  late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusCurrentPassword.addListener(onFocusChange);
    focusNewPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCurrentPassword.value = focusCurrentPassword.hasFocus;
    isNewPassword.value = focusNewPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  Future<void> callingSubmitChangePasswordForm() async {
    bodyParamsForSubmitChangePasswordForm = {
      ApiKeyConstants.userId:userModel!.userData!.id,
      ApiKeyConstants.oldPassword: currentPasswordController.text.toString(),
      ApiKeyConstants.password: newPasswordController.text.toString(),

    };
    print("bodyParamsForSubmitChangePasswordForm:::::$bodyParamsForSubmitChangePasswordForm");
    changePasswordModel = await ApiMethods.changePasswordApi(
        bodyParams: bodyParamsForSubmitChangePasswordForm);
    if (changePasswordModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      showToastMessage(changePasswordModel!.message!);
    }else{
      print("LogIn Failed....");
      showToastMessage(changePasswordModel!.message!);
      changeProgressbarStatus(false);
    }
  }


}