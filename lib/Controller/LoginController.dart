import 'dart:convert';
import 'package:attendance_app/Activity/SignUpActivity.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';

class LoginController extends GetxController{
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  TextEditingController emailPhoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};
  UserModel? userModel;
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
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }


  goToSignUpActivity(){
   Get.to(()=>const SignUpActivity());
  }

  openResetPasswordActivity(){
  //  Get.toNamed('/resetPasswordActivity');
  }

  openHomeActivity(){
    GlobalData.setUserModel(userModel!);
    Get.toNamed('/mainActivity');
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }


  Future<void> callingSubmitLogInForm() async {
    bodyParamsForSubmitLoginForm = {
      ApiKeyConstants.email: emailPhoneController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),

    };
    print("bodyParamsForSubmitLogin:::::$bodyParamsForSubmitLoginForm");
    userModel = await ApiMethods.submitLoginForm(
        bodyParams: bodyParamsForSubmitLoginForm);
    if (userModel!.status!="0"??false ) {
      saveDataSharedPreference(userModel);
    }else{
      print("LogIn Failed....");
      showToastMessage(userModel!.message!);
      changeProgressbarStatus(false);
    }
  }
  saveDataSharedPreference(UserModel? userdata) async{
    sharedPreferences=await SharedPreferences.getInstance();
    showToastMessage("Successfully Login Complete");
    print("LogIn Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    changeProgressbarStatus(false);
    openHomeActivity();
    //Get.offAndToNamed('/mainActivity');

  }

}