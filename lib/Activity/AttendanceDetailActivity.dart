
import 'package:attendance_app/Controller/AttendanceDetailController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/apis/api_models/getall_attendance_model.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.px),
          child: Obx(() => controller.showLoadingBar.value
              ? Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(10.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.px)),
                color: primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: primary3Color,)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Loading...",
                  style: MyTextStyle.titleStyle16bw,
                ),
              ],
            ),
          )
              : SizedBox(
              height: 5.px,
            ),
          ),
        ),
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
                child: CachedNetworkImage(
                  imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:110.px,height: 110.px,
                  placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:110.px,width:110.px,),
                  errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:110.px,width:110.px ,),
                ),
              ),
            ),
            SizedBox(height: 5.px,),
            Text(controller.userModel!.userData!.userName??'James Donin', style: MyTextStyle.titleStyle16bb,),
            SizedBox(height: 3.px,),
            Text(controller.userModel!.userData!.email??'James@gmail.com', style: MyTextStyle.titleStyle12b,),
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
            Obx(() => controller.presentData.value?
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showTodayAttendacnceDetail(),
                // child:SizedBox() ,
              ),
            ):Text("There are not present attendance between ${controller.parameterData['from_date']} to ${controller.parameterData['to_date']}.",style:const TextStyle(
              fontSize: 16,fontWeight: FontWeight.normal,color: Colors.redAccent,),textAlign: TextAlign.center,)
            )


          ],
        )

    );
  }

  /// Show Today Attendance details...
  Widget showTodayAttendacnceDetail() {
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
              return Container(
                padding: EdgeInsets.only(left: 10.px,right: 10.px,top: 10.px,bottom: 10.px),
                margin: EdgeInsets.only(left: 10.px,right: 10.px,top: 5.px,bottom: 5.px),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10.px)),
                     border: Border.all(color: Colors.black,width: 1.px)
                   ),
                child: Row(
                  children: [

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 15.px,
                        margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 15.px,
                        margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 15.px,
                        margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 15.px,
                        margin: EdgeInsets.only(left: 5.px, right: 5.px,bottom: 5.px,top: 5.px),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black
                        ),
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
      itemCount: controller.getAllAttendanceModel!.result!.length,
      itemBuilder: (context, int index) {
        GetAllAttendanceResult item=controller.getAllAttendanceModel!.result![index];
        return InkWell(
          onTap: (){
            controller.changeLoader(true);
            controller.callingDateWiseDataApi(item.date!);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 15.px,bottom: 15.px ),
            child: Row(
              children: [
                Expanded(
                    flex:1,
                    child: Text(item.date??'0000/0/0',style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
                ),
                Expanded(
                    flex:1,
                    child: Text(item.time!.substring(10,16)??"",style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
                ),
                Expanded(
                    flex:1,
                    child: Text(item.endTime==null?"00:00":item.endTime!.substring(10,16),style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
                ),
                Expanded(
                    flex:1,
                    child: Text(item.duration==null?"0:0 h": '${item.duration!.substring(0, 5)} h',style:MyTextStyle.titleStyle12blb ,textAlign: TextAlign.center,)
                ),
              ],
            ),
          ),
        );
      },
    )
    );
  }


}