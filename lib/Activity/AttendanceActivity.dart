
import 'package:attendance_app/Controller/AttendanceController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';


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
           Card(
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
                                Text('14',
                                  style: MyTextStyle.titleStyle16bb,),
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
                                Text('04',
                                  style: MyTextStyle.titleStyle16bb,),
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
                                Text('12',
                                  style: MyTextStyle.titleStyle16bb,),
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
            ),
            ListTile(
              horizontalTitleGap: 5.px,
              title: Text(StringConstants.today, style: MyTextStyle.titleStyle16bb,),
              trailing: Container(
                height: 35.px,width: 110.px,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5.px,right: 5.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18.px)),
                  color: primaryColor
                ),
                child:Obx(() =>DropdownButton(
                    value: controller.monthValue.value,
                    icon: Icon(Icons.arrow_drop_down,size: 25.px,color: primary3Color,),
                    items: controller.monthList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: MyTextStyle.titleStyle14bw,),
                        // onTap: (){
                        //  // controller.changeMonthValueStatus(items);
                        // },
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controller.changeMonthValueStatus(newValue!);
                    }
                    ,underline:Divider(color: primaryColor,thickness: 0.01.px,),dropdownColor: primaryColor,
                ),
                )
              ),

            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showNearEvents(),
                // child:SizedBox() ,
              ),
            ),


          ],
        )

    );
  }

  /// Show Near Events...
  Widget showNearEvents() {
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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 180.px,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 170.px, width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: textColor
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
      itemCount: 8,
      itemBuilder: (context, int index) {
        // GetClubsResult item=controller.getClubsModel!.result![index];
        return GestureDetector(
          onTap: () {
            // controller.openClubAllEventActivity(item.id!,item.fullName!);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            elevation: 2.px,
            margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 5.px),

            child: Padding(
              padding: EdgeInsets.only(left:10.px,right: 10.px,top: 15.px,bottom: 15.px ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:  SizedBox(
                      height: 35.px, width: 35.px,
                      child: Image.asset(ImageConstants.girlImg, fit: BoxFit.fill,),
                    ),),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 5.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Dec. 28 2023', style: MyTextStyle.titleStyle12bl,),
                          SizedBox(height: 5.px,),
                          Text('Desirae Philips', style: MyTextStyle.titleStyle16bb,),
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
                        Text('10:00 am', style: MyTextStyle.titleStyle12bb,),
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
                        Text('Check In', style: MyTextStyle.titleStyle12bb,),
                        SizedBox(height: 3.px,),
                        Text('Check Out', style: MyTextStyle.titleStyle12bl,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    )
    );
  }


}