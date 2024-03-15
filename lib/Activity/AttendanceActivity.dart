
import 'package:attendance_app/Controller/AttendanceController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/apis/api_models/today_attendance_model.dart';
import 'package:attendance_app/common/ShowToast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../common/CommonWidget.dart';


class AttendanceActivity extends StatefulWidget{
  const AttendanceActivity({super.key});

  @override
  State<AttendanceActivity> createState() =>_AttendanceState();
}
class _AttendanceState extends State<AttendanceActivity> {
  AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary3Color,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.px,top: 20.px),
                child:Text(StringConstants.attendance, style: MyTextStyle.titleStyle24bb,),
              ),
            ),
        SizedBox(height: 10.px,),
        /*   Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.px)),
              ),
              margin: EdgeInsets.all(20.px),
              elevation: 2.px,
              child: Container(
                height: 150.px, width: double.infinity,
                padding: EdgeInsets.all(10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.px,),
                    Text(StringConstants.totalAttendanceStatus, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.px,color: primaryColor),),
                    SizedBox(height: 20.px,),
                    Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.px,),
                                Obx(() =>   Text(controller.available.value,
                                  style: MyTextStyle.titleStyle16bb,),),
                                SizedBox(height: 10.px,),
                                Text(StringConstants.available,
                                  style: MyTextStyle.titleStyle12blb,),
                                SizedBox(height: 10.px,),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.px,),
                               Obx(() =>  Text(controller.halfDay.value,
                                 style: MyTextStyle.titleStyle16bb,),),
                                SizedBox(height: 10.px,),
                                Text(StringConstants.halfDay,
                                  style: MyTextStyle.titleStyle12blb,),
                                SizedBox(height: 10.px,),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.px,),
                                Obx(() => Text(controller.totalDay.value,
                                  style: MyTextStyle.titleStyle16bb,),),
                                SizedBox(height: 10.px,),
                                Text(StringConstants.totalDays,
                                  style: MyTextStyle.titleStyle12blb,),
                                SizedBox(height: 10.px,),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),  */
            ListTile(
              horizontalTitleGap: 5.px,
              title: Text(StringConstants.today, style: MyTextStyle.titleStyle16bb,),
              trailing: GestureDetector(
                onTap: (){
                 openDatePickerBox(context);
                  },
                child: Container(
                  height: 35.px,width: 110.px,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 5.px,right: 5.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18.px)),
                    color: primaryColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.px),
                        child: Text('Month',style: MyTextStyle.titleStyle16bw,),
                      ),
                      Icon(Icons.keyboard_arrow_down,size: 25.px,color: primary3Color,)
                    ],
                  ),
                  ),
              )
              ),

            Obx(() => controller.presentData.value?
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showTodayAttendance(),
                // child:SizedBox() ,
              ),
            ):const Text("There are not present today attendance.",style:TextStyle(
              fontSize: 16,fontWeight: FontWeight.normal,color: Colors.redAccent,),textAlign: TextAlign.center,)
            )


          ],
        )

    );
  }

  /// Show Near Events...
  Widget showTodayAttendance() {
    return Obx(() =>
    controller.showProgressbar.value ?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showProgressbar.value,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.px,right: 10.px,top: 5.px,bottom: 5.px),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                        child: Container(
                          height: 40.px, width:40.px,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.black
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        )
    ) :
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.todayAttendanceModel!.result!.length,
      itemBuilder: (context, int index) {
        TodayAttendanceResult item=controller.todayAttendanceModel!.result![index];
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
                          imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:30.px,height: 30.px,
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
                        Text(controller.userModel!.userData!.userName??'Desirae Philips', style: MyTextStyle.titleStyle16bb,),
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
    );
  }




  /// Show Date Picker Box...
  void openDatePickerBox(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
              ),
              value: controller.selectDates,
              onValueChanged: (dates) {
                controller.changeSelectedDates(dates);
              }
            )
        ),
        alignment: Alignment.center,

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

        ],
      ),
    );

  }


}