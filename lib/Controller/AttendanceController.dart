
import 'package:attendance_app/Activity/AttendanceDetailActivity.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:get/get.dart';



class AttendanceController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String>icon=[IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,];
  List<String>type=['Check In','Tea Break','Check In','Tea Break',];
  List<String>time=['10:00 am','10:00 am','10:00 am','10:00 am',];

  RxString monthValue = 'Monthly'.obs;

  // List of items in our dropdown menu
  var monthList = ['Monthly','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November','December'];


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

  changeMonthValueStatus(String month){
    monthValue.value=month;
    openAttendanceDetailActivity();
  }
  openAttendanceDetailActivity(){
    Get.to(()=> const AttendanceDetailActivity() );
  }


}