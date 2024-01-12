
import 'package:attendance_app/Activity/TypingActivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String> getFriendsModel=['Dulce Lipshutz','Corey Bergson','Alfonso Workman','Giana Torff','Lincoln Bator','Livia Westervelt','Giana Torff','Lincoln Bator','Livia Westervelt'];
  List<String> filterUsersList=[];


  @override
  void onInit() {
    super.onInit();
    showAllUsers();

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
  changeShowLoadingBar(bool value){
    showLoadingBar.value=value;
  }
  changeChangeGpsStatus(bool value){
    gpsStatus.value=value;
  }
  showAllUsers(){
    filterUsersList=getFriendsModel;
  }
  changeFilterUsersList(String query){
    filterUsersList = getFriendsModel
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }

  openTypingPage(){
    Get.to(()=>const TypingActivity() );
  }


}