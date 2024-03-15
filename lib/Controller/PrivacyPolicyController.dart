
import 'package:attendance_app/apis/api_models/get_privacypolicy_model.dart';
import 'package:get/get.dart';

import '../apis/api_methods/api_methods.dart';

class PrivacyPolicyController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  GetPrivacyPolicyModel? getPrivacyPolicyModel;
  @override
  void onInit() {
    super.onInit();
    callingPrivacyPolicyApi();
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
  Future<void> callingPrivacyPolicyApi() async {
    getPrivacyPolicyModel = await ApiMethods.getPrivacyPolicy();
    if (getPrivacyPolicyModel!.status!="0"??false ) {
       changeShowProgressBar(false);
    }else{
      print("Get Profile Failed....");
      changeShowProgressBar(true);
    }
  }

}