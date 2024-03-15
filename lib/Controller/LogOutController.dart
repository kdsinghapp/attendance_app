
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogOutController extends GetxController{
  RxBool showNearEventsProgressBar=false.obs;
  late SharedPreferences sharedPreferences;

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


  logout() async{
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offNamedUntil('/mainActivity', (route) => false);
    Get.offAllNamed('/loginActivity');
  }


}