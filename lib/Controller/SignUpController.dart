import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpController extends GetxController{
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  TextEditingController fullNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController emailPhoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FocusNode focusFullName = FocusNode();
  FocusNode focusMobile = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isMobile = false.obs;
  final isEmail = false.obs;
  final isPassword = false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};
  //LogInModel? logInModel;
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
    focusFullName.addListener(onFocusChange);
    focusMobile.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isMobile.value = focusMobile.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }



  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

/*
  Future<void> callingSubmitLogInForm() async {
    bodyParamsForSubmitLoginForm = {
      ApiKeyConstants.email: emailPhoneController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitLoginForm");
    logInModel = await ApiMethods.logInApi(
        bodyParams: bodyParamsForSubmitLoginForm);
    if (logInModel!.status!="0"??false ) {
      saveDataSharedPreference(logInModel);
    }else{
      print("LogIn Failed....");
      showToastMessage(logInModel!.message!);
      changeProgressbarStatus(false);
    }
  }
  saveDataSharedPreference(LogInModel? userdata) async{
    sharedPreferences=await SharedPreferences.getInstance();
    showToastMessage("Successfully Login Complete");
    print("LogIn Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    changeProgressbarStatus(false);
    //openHomeActivity();
    Get.offAndToNamed('/mainActivity');

  }  */

}