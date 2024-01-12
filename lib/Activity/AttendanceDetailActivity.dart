
import 'package:attendance_app/Controller/AttendanceDetailController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';


class AttendanceDetailActivity extends StatefulWidget{
  const AttendanceDetailActivity({super.key});

  @override
  State<AttendanceDetailActivity> createState() =>_AttendanceDetailState();
}
class _AttendanceDetailState extends State<AttendanceDetailActivity> {
  AttendanceDetailController controller = Get.put(AttendanceDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary3Color,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10.px),
                child: ListTile(
                  leading:  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: SizedBox(
                      height: 40.px, width: 40.px,
                      child: Image.asset(IconsConstants.backIcon,fit: BoxFit.fill,),
                    ),
                  ),
                  title: Center(child: Padding(
                    padding:EdgeInsets.only(right: 50.px),
                    child: Text(StringConstants.details, style: MyTextStyle.titleStyle20bb,),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 110.px, width: 110.px,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.px)),
                child:Image.asset(ImageConstants.boyImg,fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 5.px,),
            Text('James Donin', style: MyTextStyle.titleStyle16bb,),
            SizedBox(height: 3.px,),
            Text('James Donin@petra.africa', style: MyTextStyle.titleStyle12b,),
            SizedBox(height: 20.px,),
            Container(
              height: 50.px,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex:1,
                      child: Text(StringConstants.day,style:MyTextStyle.titleStyle14bw ,textAlign: TextAlign.center,)
                  ),
                  Expanded(
                      flex:1,
                      child: Text(StringConstants.checkIn,style:MyTextStyle.titleStyle14bw ,textAlign: TextAlign.center,)
                  ),
                  Expanded(
                      flex:1,
                      child: Text(StringConstants.checkOut,style:MyTextStyle.titleStyle14bw ,textAlign: TextAlign.center,)
                  ),
                  Expanded(
                      flex:1,
                      child: Text(StringConstants.timeWorked,style:MyTextStyle.titleStyle14bw ,textAlign: TextAlign.center,)
                  )
                ],
              ),
            ),
            SizedBox(height: 10.px,),
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
      itemCount: 15,
      itemBuilder: (context, int index) {
        // GetClubsResult item=controller.getClubsModel!.result![index];
        return Padding(
          padding: EdgeInsets.only(top: 15.px,bottom: 15.px ),
          child: Row(
            children: [
              Expanded(
                  flex:1,
                  child: Text((index+1).toString(),style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
              ),
              Expanded(
                  flex:1,
                  child: Text('10:00 am',style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
              ),
              Expanded(
                  flex:1,
                  child: Text('07:00 pm',style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
              ),
              Expanded(
                  flex:1,
                  child: Text('9 h',style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
              ),
            ],
          ),
        );
      },
    )
    );
  }


}