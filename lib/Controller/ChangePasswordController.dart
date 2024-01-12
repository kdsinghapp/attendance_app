import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};

  late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
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


}