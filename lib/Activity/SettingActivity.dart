
import 'package:attendance_app/Controller/SettingController.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class SettingActivity extends StatefulWidget{
  const SettingActivity({super.key});

  @override
  State<SettingActivity> createState() =>_SettingState();
}
class _SettingState extends State<SettingActivity> {
  SettingController controller = Get.put(SettingController());

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
                      child: Text(StringConstants.setting, style: MyTextStyle.titleStyle20bb,),
                    )),
                  ),
                ),
            ),

            SizedBox(height: 10.px,),
            Padding(
              padding: EdgeInsets.all(10.px),
              child: Column(
                children: [
                  ListTile(
                    onTap:(){
                       controller.openChangePasswordPage();
                      },
                    leading: SizedBox(
                      height: 40.px, width: 40.px,
                      child: Image.asset(IconsConstants.changePasswordIcon,fit: BoxFit.fill,),
                    ),
                    title: Text(StringConstants.changePassword, style: MyTextStyle.titleStyle14bb,),
                    trailing: Icon(Icons.keyboard_arrow_right,size: 25.px,),
                  ),
                  Divider(color:const Color(0xFFDADADA),thickness: 1.px,indent: 10.px,endIndent: 10.px,),
                  ListTile(
                    onTap:(){
                     controller.openNotificationPage();
                    },
                    leading: SizedBox(
                      height: 40.px, width: 40.px,
                      child: Image.asset(IconsConstants.notification1Icon,fit: BoxFit.fill,),
                    ),
                    title: Text(StringConstants.notification, style: MyTextStyle.titleStyle14bb,),
                    trailing: Icon(Icons.keyboard_arrow_right,size: 25.px,),
                  ),
                  Divider(color:const Color(0xFFDADADA),thickness: 1.px,indent: 10.px,endIndent: 10.px,),
                ],
              ),
            ),


          ],
        )

    );
  }


}