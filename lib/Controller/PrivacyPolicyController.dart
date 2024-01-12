
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
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


}