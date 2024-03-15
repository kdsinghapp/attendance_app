import 'package:attendance_app/Controller/NotificationListController.dart';
import 'package:attendance_app/Controller/SettingController.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/apis/api_models/get_notification_model.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/imageconstants.dart';



class NotificationListActivity extends StatefulWidget{
  const NotificationListActivity({super.key});

  @override
  State<NotificationListActivity> createState() =>_NotificationListState();
}
class _NotificationListState extends State<NotificationListActivity> {
  NotificationListController controller = Get.put(NotificationListController());

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
                    child: Text(StringConstants.notification, style: MyTextStyle.titleStyle20bb,),
                  )),
                ),
              ),
            ),

            SizedBox(height: 10.px,),
            Obx(() => controller.presentData.value?
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showNotificationList(),
                // child:SizedBox() ,
              ),
            ):const Text("There are not present any notification.",style: TextStyle(
               fontSize: 16,fontWeight: FontWeight.normal,color: Colors.redAccent,),textAlign: TextAlign.center,)
            )




          ],
        )

    );
  }


  /// Show Notification List...
  Widget showNotificationList() {
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
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.px,right: 10.px,top: 5.px,bottom: 5.px),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
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
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Container(
                            height: 10.px,
                            width: 50.px,
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
      itemCount: controller.getNotificationModel!.data!.length,
      itemBuilder: (context, int index) {
        GetNotificationData item=controller.getNotificationModel!.data![index];
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.px))
          ),
          elevation: 2.px,
          margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 5.px),

          child: Padding(
            padding: EdgeInsets.only(left:10.px,right: 10.px,top: 10.px,bottom: 10.px ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child:  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 40.px, width: 40.px,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.px)),
                        child:item.type=="Password Changed"?
                        Image.asset(IconsConstants.circleKeyIcon,fit: BoxFit.fill,height: 40.px,width: 40.px,):
                        Image.asset(IconsConstants.circleProfileIcon,fit: BoxFit.fill,height: 40.px,width: 40.px,),
                      ),
                    ),
                  ),),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 5.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.type??'', style: MyTextStyle.titleStyle14b,),
                        SizedBox(height: 5.px,),
                        Text(item.message??'', style: MyTextStyle.titleStyle14bb,),
                        Text(calculateTimeDifference(item.dateTime!)??'', style: MyTextStyle.titleStyle12bl,),
                      ],
                    ),
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
  String calculateTimeDifference(String time) {
    DateTime givenTime = DateTime.parse(time);
    DateTime now = DateTime.now();

    Duration difference = now.difference(givenTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else {
      int months = difference.inDays ~/ 30;
      return '$months months ago';
    }
  }

}