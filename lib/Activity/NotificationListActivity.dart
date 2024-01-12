import 'package:attendance_app/Controller/NotificationListController.dart';
import 'package:attendance_app/Controller/SettingController.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showNotificationList(),
                // child:SizedBox() ,
              ),
            ),


          ],
        )

    );
  }


  /// Show Notification List...
  Widget showNotificationList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.icon.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(left:20.px,right: 20.px),

          child: Column(
            children: [
              ListTile(

                leading: SizedBox(
                  height: 40.px, width: 40.px,
                  child: Image.asset(controller.icon[index],fit: BoxFit.fill,),
                ),
                title: Text(controller.list[index], style: MyTextStyle.titleStyle12bb,),
                subtitle: Text(controller.subList[index], style: MyTextStyle.titleStyle12b,),
              ),
              Divider(color:const Color(0xFFDADADA),thickness: 1.px,indent: 10.px,endIndent: 10.px,)
            ],
          ),
        );
      },
    );
  }


}