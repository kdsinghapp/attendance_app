import 'package:attendance_app/Controller/PrivacyPolicyController.dart';
import 'package:attendance_app/Controller/TermConditionController.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermConditionActivity extends StatefulWidget{
  const TermConditionActivity({super.key});

  @override
  State<TermConditionActivity> createState() =>_TermConditionState();
}
class _TermConditionState extends State<TermConditionActivity> {
  TermsConditionController controller = Get.put(TermsConditionController());

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
                      child: Text(StringConstants.termConditions, style: MyTextStyle.titleStyle20bb,),
                    )),
                  ),
                ),
              ),

              SizedBox(height: 10.px,),
              SizedBox(height: 200.px,
                child: Image.asset(ImageConstants.teamsImg,fit: BoxFit.cover,),
              ),
              Padding(
                  padding:  EdgeInsets.only(left: 15.px,right: 15.px,bottom: 5.px,top:40.px),
                  child: Obx(() => controller.showProgressbar.value?
                  const Center(child:CircularProgressIndicator()):
                  Text(controller.getTermConditionModel!.result![0].description!,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,),)

              ),



            ],
          ),
        )

    );
  }


}