import 'package:attendance_app/Controller/LogOutController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Common/CommonWidget.dart';
import '../Tool/MyTextStyle.dart';
import '../constant/iconsconstants.dart';

class LogOutActivity extends StatefulWidget {
  const LogOutActivity({super.key});

  @override
  State<LogOutActivity> createState() => _LogoutState();
}

class _LogoutState extends State<LogOutActivity> {
  LogOutController controller=Get.put(LogOutController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,

      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
                    child: Text(StringConstants.logout, style: MyTextStyle.titleStyle20bb,),
                  )),
                ),
              ),
            ),
            SizedBox(height: 250.px,),
            Text(StringConstants.logout,style: MyTextStyle.titleStyle24bb,),
            Text("Are you sure?",style: MyTextStyle.titleStyle14b,),
            Padding(
              padding:  EdgeInsets.only(left: 30.px,right: 30.px,bottom: 5.px,top:40.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        controller.logout();
                      },
                      text: StringConstants.yes,
                      wantContentSizeButton: true,
                      width: 120.px,
                      height: 50.px,
                      borderRadius: 25.px
                  ),
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        Get.back();
                      },
                      text: StringConstants.no,
                      wantContentSizeButton: true,
                      width: 120.px,
                      height: 50.px,
                      borderRadius: 25.px,
                      buttonColor: Colors.grey
                  ),
                ],
              ),
            ),


            //SizedBox(height: 20.px,),
            SizedBox(height: 10.px,),


          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}