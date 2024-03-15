import 'package:attendance_app/Controller/PrivacyPolicyController.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrivacyPolicyActivity extends StatefulWidget{
  const PrivacyPolicyActivity({super.key});

  @override
  State<PrivacyPolicyActivity> createState() =>_PrivacyState();
}
class _PrivacyState extends State<PrivacyPolicyActivity> {
  PrivacyPolicyController controller = Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary3Color,
        body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.px),
                  child: ListTile(
                    leading: GestureDetector(
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
                      child: Text(StringConstants.privacyPolicy, style: MyTextStyle.titleStyle20bb,),
                    )),
                  ),
                ),
              ),

              SizedBox(height: 10.px,),
              SizedBox(height: 200.px,
                child: Image.asset(ImageConstants.privacyPolicyImg,fit: BoxFit.cover,),
              ),
              Padding(
                  padding:  EdgeInsets.only(left: 15.px,right: 15.px,bottom: 5.px,top:40.px),
                  child: Obx(() => controller.showProgressbar.value?
                  const Center(child:CircularProgressIndicator()):
                  Text(controller.getPrivacyPolicyModel!.result![0].description!,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,),)

              ),

            ],
          ),
        )

    );
  }


}