
import 'package:attendance_app/Controller/LeaveStatusController.dart';

import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/apis/api_models/get_leavestatus_model.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/iconsconstants.dart';


class LeaveStatusActivity extends StatefulWidget{
  const LeaveStatusActivity({super.key});

  @override
  State<LeaveStatusActivity> createState() =>_LeaveStatusState();
}
class _LeaveStatusState extends State<LeaveStatusActivity> {
  LeaveStatusController controller = Get.put(LeaveStatusController());

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
                    child: Text(StringConstants.leaveStatus, style: MyTextStyle.titleStyle20bb,),
                  )),
                ),
              ),
            ),

            SizedBox(height: 10.px,),
            Obx(() => controller.presentData.value?
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showAllLeaveStatus(),
                // child:SizedBox() ,
              ),
            ):const Text("There are not present any leave status.",style:TextStyle(
              fontSize: 16,fontWeight: FontWeight.normal,color: Colors.redAccent,),textAlign: TextAlign.center,)
            )


          ],
        )

    );
  }

  /// Show All Leave Status...
  Widget showAllLeaveStatus() {
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
              return ListTile(
                leading: Container(
                  height: 50.px, width: 50.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.px)),
                    color: Colors.black
                  ),
                ),
                title: Container(
                  height: 15.px, width: 150.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.px)),
                      color: Colors.black
                  ),
                ),
                subtitle: Container(
                  height: 15.px, width: 100.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.px)),
                      color: Colors.black
                  ),
                ),
                trailing:  Container(
                  height: 15.px, width: 50.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.px)),
                      color: Colors.black
                  ),
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
      itemCount: controller.getLeaveStatusModel!.result!.length,
      itemBuilder: (context, int index) {
        GetLeaveStatusResult item=controller.getLeaveStatusModel!.result![index];
        return GestureDetector(
          onTap: () {
            openLeaveDetailBox(context,item);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            elevation: 0.px,
            margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 5.px),

            child: ListTile(
              leading: SizedBox(
                height: 50.px, width: 50.px,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.px)),
                  child: CachedNetworkImage(
                    imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:50.px,height: 50.px,
                    placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 50.px,width: 50.px,),
                    errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:50.px,width:50.px ,),
                  ),
                ),
              ),
              title: Text(controller.userModel!.userData!.userName!, style: MyTextStyle.titleStyle14bb,),
              subtitle: Text(item.leaveFromDate.toString(), style: MyTextStyle.titleStyle12b,),
              trailing: Text(item.status.toString(), style: MyTextStyle.titleStyle12b,),
            ),
          ),
        );
      },
    )
    );
  }


  /// Show Attendance Details Picker Box...
  void openLeaveDetailBox(BuildContext context,GetLeaveStatusResult model) async {
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
            child: Text('Leave Status',style:MyTextStyle.titleStyle14bb,
              textAlign: TextAlign.center,)
        ),
        content:  Container(
            height: 300.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(15.px),
            child:ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 10.px,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                        child: Text('Apply Date:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.dateTime!.substring(0,10), style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ),
                SizedBox(height: 10.px,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Leave From Date:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.leaveFromDate!.substring(0,10), style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ),
                SizedBox(height: 10.px,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Leave To Date:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.leaveToDate!.substring(0,10), style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ),
                SizedBox(height: 10.px,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Leave Status:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.status!, style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ),
                SizedBox(height: 10.px,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Your Reason:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.reason!, style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ),
                SizedBox(height: 10.px,),
                model.status!='Pending'?
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Admin Reply:-', style: MyTextStyle.titleStyle14b,),
                    ),
                    Expanded(
                      flex:2 ,
                      child: Text(model.adminReply!, style: MyTextStyle.titleStyle14bb,),
                    ),
                  ],
                ):SizedBox(height: 5.px,)

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