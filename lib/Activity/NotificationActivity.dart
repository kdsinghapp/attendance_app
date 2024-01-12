
import 'package:attendance_app/Controller/NotificationController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationActivity extends StatefulWidget{
  const NotificationActivity({super.key});

  @override
  State<NotificationActivity> createState() =>_NotificationState();
}
class _NotificationState extends State<NotificationActivity> {
  NotificationController controller = Get.put(NotificationController());

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
            Padding(
              padding: EdgeInsets.all(20.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Default Notification Actions',style: MyTextStyle.titleStyle16bb,),
                          Text('You want to receive bill reminders before a bill is due.',style: MyTextStyle.titleStyle12b,),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: GFToggle(
                        onChanged: (val){
                          if(val!){

                          }
                        },
                        value: true,
                        disabledTrackColor: editTextButton,
                        enabledTrackColor: primaryColor,
                        enabledThumbColor:primary3Color,
                        disabledThumbColor:primary3Color ,
                        type: GFToggleType.ios,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Override Do Not Disturb',style: MyTextStyle.titleStyle16bb,),
                          Text('Let these notifications continue to interrupt when Do Not Disturb is on',style: MyTextStyle.titleStyle12b,),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: GFToggle(
                        onChanged: (val){
                          if(val!){

                          }
                        },
                        value: true,
                        disabledTrackColor: editTextButton,
                        enabledTrackColor: primaryColor,
                        enabledThumbColor:primary3Color,
                        disabledThumbColor:primary3Color ,
                        type: GFToggleType.ios,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lock screen',style: MyTextStyle.titleStyle16bb,),
                          Text('Lock screen',style: MyTextStyle.titleStyle12b,),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: GFToggle(
                        onChanged: (val){
                          if(val!){

                          }
                        },
                        value: false,
                        disabledTrackColor: editTextButton,
                        enabledTrackColor: primaryColor,
                        enabledThumbColor:primary3Color,
                        disabledThumbColor:primary3Color ,
                        type: GFToggleType.ios,
                      ),
                    ),
                  )
                ],
              ),
            ),


          ],
        )

    );
  }


}