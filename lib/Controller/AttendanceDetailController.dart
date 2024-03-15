
import 'package:attendance_app/apis/api_models/getall_attendance_model.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/MyTextStyle.dart';
import '../apis/api_constants/api_key_constants.dart';
import '../apis/api_methods/api_methods.dart';
import '../apis/api_models/get_datewisedata_model.dart';
import '../apis/api_models/user_model.dart';
import '../common/ShowToast.dart';
import '../common/globalData.dart';
import '../constant/imageconstants.dart';



class AttendanceDetailController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  RxBool presentData=true.obs;
  RxBool showLoadingBar=false.obs;
  RxBool gpsStatus=false.obs;
  List<String>icon=[IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,IconsConstants.checkInIcon,IconsConstants.teaBreakIcon,];
  List<String>type=['Check In','Tea Break','Check In','Tea Break',];
  List<String>time=['10:00 am','10:00 am','10:00 am','10:00 am',];

  Map<String,String?>parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForAllAttendanceList = {};
  Map<String, dynamic> bodyParamsForGetDataByUseDate = {};
  GetAllAttendanceModel? getAllAttendanceModel;
  GetDateWiseDataModel? getDateWiseDataModel;
  UserModel? userModel;


  @override
  void onInit() {
    super.onInit();
    userModel=GlobalData.getUserModel();
   callingAllAttendanceForm();
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
  changeLoader(bool value){
    showLoadingBar.value=value;
  }
  changePresentData(bool value){
    presentData.value=value;
  }

  void callingAllAttendanceForm() async {
    bodyParamsForAllAttendanceList = {
      ApiKeyConstants.userId: userModel!.userData!.id,
      ApiKeyConstants.fromDate: parameterData['from_date'],
      ApiKeyConstants.toDate:  parameterData['to_date'],
    };
    print("bodyParamsForAllAttendance:::::$bodyParamsForAllAttendanceList");
    getAllAttendanceModel = await ApiMethods.getAllAttendanceList(
        bodyParams: bodyParamsForAllAttendanceList);
    if (getAllAttendanceModel!.status!="0"??false ) {
      changeShowProgressBar(false);
      print("Get All Attendance List Successfully complete....");
    }else{
      print("Get All Attendance List  Failed....");
      showToastMessage(getAllAttendanceModel!.message!);
      changePresentData(false);
    }
  }


  void callingDateWiseDataApi(String date) async {
    bodyParamsForGetDataByUseDate = {
      ApiKeyConstants.userId: userModel!.userData!.id,
      ApiKeyConstants.date:date,
    };
    print("bodyParamsForDateWiseDataApi:::::$bodyParamsForGetDataByUseDate");
    getDateWiseDataModel = await ApiMethods.getDateWiseDataApi(
        bodyParams: bodyParamsForGetDataByUseDate);
    if (getDateWiseDataModel!.status!="0"??false ) {
      openDateWiseAttendanceDetailBox(Get.context!,getDateWiseDataModel!);
      print("Get Date Wise Data List Successfully complete....");
    }else{
      print("Get Date Wise Data List  Failed....");
      showToastMessage(getDateWiseDataModel!.message!);
      changeLoader(false);
    }
  }

  /// Show Attendance Details Picker Box...
  void openDateWiseAttendanceDetailBox(BuildContext context,GetDateWiseDataModel model) async {
    changeLoader(false);
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        title: Center(
          child: Text('Attendance Details Date Wise',style:MyTextStyle.titleStyle14bb,
            textAlign: TextAlign.center,)
        ),
        content:  Container(
            height: 360.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(5.px),
            child:ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: model.result!.length,
                  itemBuilder: (context, int index) {
                    GetDateWiseDataResult item=model.result![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.px))
                      ),
                      elevation: 2.px,
                      margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 5.px),

                      child: Padding(
                        padding: EdgeInsets.only(left:5.px,right: 5.px,top: 10.px,bottom: 10.px ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 30.px, width: 30.px,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.px)),
                                    child: CachedNetworkImage(
                                      imageUrl:'${userModel!.userData!.image!}', fit:BoxFit.cover,width:30.px,height: 30.px,
                                      placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 30.px,width: 30.px,),
                                      errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:30.px,width:30.px ,),
                                    ),
                                  ),
                                ),
                              ),),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 5.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(item.date??'', style: MyTextStyle.titleStyle12bl,),
                                    SizedBox(height: 5.px,),
                                    Text(userModel!.userData!.userName??'Desirae Philips', style: MyTextStyle.titleStyle16bb,),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.time!.substring(10,16)??"", style: MyTextStyle.titleStyle12bb,),
                                  SizedBox(height: 3.px,),
                                  Text('Check In', style: MyTextStyle.titleStyle12bl,),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.endTime==null?"00:00":item.endTime!.substring(10,16), style: MyTextStyle.titleStyle12bb,),
                                  SizedBox(height: 3.px,),
                                  Text('Check Out', style: MyTextStyle.titleStyle12bl,),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.checkType!, style: MyTextStyle.titleStyle10bb,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            )
        ),
        alignment: Alignment.center,
/*
        actions: <Widget>[
          CommonWidget.commonElevatedButton(
              onPressed: (){
                if(controller.selectDates.length>0){
                  Get.back();
                  controller.openAttendanceDetailActivity();
                }else{
                  showToastMessage("Select dates ...");
                }
                //controller.openAdminWardrobeActivity();
              },
              text: StringConstants.submit,
              buttonMargin: EdgeInsets.all(10.px),
              borderRadius: 25.px
          ),

        ],  */
      ),
    );

  }


}