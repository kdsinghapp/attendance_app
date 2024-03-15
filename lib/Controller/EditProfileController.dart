
import 'dart:io';

import 'package:attendance_app/apis/api_models/edit_profile_model.dart';
import 'package:attendance_app/apis/api_models/user_model.dart';
import 'package:attendance_app/common/globalData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class EditProfileController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  UserModel? userModel;

  TextEditingController fullNameController=TextEditingController();
  TextEditingController companyNameController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController genderController=TextEditingController();

  FocusNode focusFullName = FocusNode();
  FocusNode focusCompanyName = FocusNode();
  FocusNode focusDob = FocusNode();
  FocusNode focusMobile = FocusNode();
  FocusNode focusGender = FocusNode();
  String genderString='Male';
  List<String> genderType = ['Male', 'Female'];
  List<DateTime?> selectDates=[DateTime.now()];
  final isFullName = false.obs;
  final isCompanyName = false.obs;
  final isDob = false.obs;
  final isMobile = false.obs;
  final isGender = false.obs;
  final formKey = GlobalKey<FormState>();
  RxBool isSelectedFile=false.obs;
  File? selectedFile;
  Map<String, dynamic> bodyParamsForSubmitChangeProfileForm = {};
  Map<String,dynamic> bodyParamsForGetProfile={};
  EditProfileModel? editProfileModel;
  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
    startListener();
    saveDataText();
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
  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusCompanyName.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
    focusMobile.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isCompanyName.value = focusCompanyName.hasFocus;
    isDob.value = focusDob.hasFocus;
    isMobile.value = focusMobile.hasFocus;
    isGender.value = focusGender.hasFocus;
  }
  void saveDataText(){
    fullNameController.value=TextEditingValue(text: userModel!.userData!.userName!);
    companyNameController.value=TextEditingValue(text: userModel!.userData!.companyName!);
    dobController.value=TextEditingValue(text: userModel!.userData!.dob!);
    mobileController.value=TextEditingValue(text: userModel!.userData!.mobile!);
    genderController.value=TextEditingValue(text: userModel!.userData!.gender!);
  }
  changeSelectedDates(List<DateTime?> modelDates){
    selectDates=modelDates;
    dobController.value=TextEditingValue(text:selectDates[0].toString().substring(0,10));
  }
  changeShowProgressBar(bool value){
    showProgressbar.value=value;

  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedFile = File(pickedFile.path);
      isSelectedFile.value=true;
    } else {
      selectedFile=null;
      isSelectedFile.value=false;
      print('No image selected.');
    }
  }
  Future<void> callingSubmitChangeProfileForm() async {
    bodyParamsForSubmitChangeProfileForm = {
      ApiKeyConstants.userId:userModel!.userData!.id,
      ApiKeyConstants.userName:fullNameController.text.toString(),
      ApiKeyConstants.mobile:mobileController.text.toString(),
      ApiKeyConstants.dob:dobController.text.toString(),
      ApiKeyConstants.gender: genderController.text.toString(),
    };
    print("bodyParamsForSubmitChangeProfileForm:::::$bodyParamsForSubmitChangeProfileForm");
    editProfileModel = await ApiMethods.editProfileApi(
        bodyParams: bodyParamsForSubmitChangeProfileForm,image:selectedFile );
    if (editProfileModel!.status!="0"??false ) {
      callingGetProfileApi(userModel!.userData!.id!);
      print("Edit Profile  Successfully Complete....");
    }else{
      print("Edit Profile Failed....");
      showToastMessage(editProfileModel!.message!);
      changeShowProgressBar(false);
    }
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
      changeShowProgressBar(false);
      showToastMessage("Profile updated successfully complete");
    }else{
      print("Get Profile Failed....");
      showToastMessage(userModel!.message!);
    }
  }



}