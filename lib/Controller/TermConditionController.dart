
import 'package:attendance_app/apis/api_models/get_termcondition_model.dart';
import 'package:get/get.dart';

import '../apis/api_methods/api_methods.dart';

class TermsConditionController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  GetTermConditionModel? getTermConditionModel;
  @override
  void onInit() {
    super.onInit();
    callingTermConditionApi();
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
  Future<void> callingTermConditionApi() async {
    getTermConditionModel = await ApiMethods.getTermCondition();
    if (getTermConditionModel!.status!="0"??false ) {
      changeShowProgressBar(false);
    }else{
      print("Get Term Condition Failed....");
      changeShowProgressBar(true);
    }
  }

}