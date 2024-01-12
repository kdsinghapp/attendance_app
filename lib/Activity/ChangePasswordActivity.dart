import 'package:attendance_app/Controller/ChangePasswordController.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../common/validations.dart';
import '../constant/stringconstants.dart';
class ChangePasswordActivity extends StatefulWidget {
  const ChangePasswordActivity({super.key});

  @override
  State<ChangePasswordActivity> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordActivity> {
  ChangePasswordController controller=Get.put(ChangePasswordController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor:primary3Color ,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.px),
          child: Obx(()=>controller.showProgressbar.value?
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(10.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.px)),
                color: primaryColor
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height:30,width:30,
                    child:CircularProgressIndicator(color:primary3Color,)
                ),
                const SizedBox(width: 10,),
                Text("Loading...",style: MyTextStyle.titleStyle16bw,),

              ],
            ),
          ):
          GestureDetector(
            onTap: (){
              //checkGpsLocation();
            },
            child: Container(
              height: 50.px,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.px,right: 20.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.px)),
                  color: primaryColor
              ),
              clipBehavior: Clip.hardEdge,
              child: Text(StringConstants.save,style:MyTextStyle.titleStyle16bw,textAlign: TextAlign.center,),
            ),
          )
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text(StringConstants.changePassword, style: MyTextStyle.titleStyle20bb,),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 40.px,),
                CommonWidget.commonTextField(
                  validator: (value)=>FormValidator.isPasswordValid(value: value),
                  controller: controller.currentPasswordController,
                  isCard: controller.isCurrentPassword.value,
                  focusNode: controller.focusCurrentPassword,
                  hintText: '*******',
                  labelText: StringConstants.currentPassword,
                    obscureText: controller.hide.value,
                  hintTextColor: controller.isCurrentPassword.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.clickOnEyeButton(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Icon(
                          controller.hide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:text2Color,
                          size: 18.px,
                        )),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(left: 20.px,right: 20.px)
                ),
                SizedBox(height: 10.px,),
                CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isPasswordValid(value: value),
                  controller: controller.newPasswordController,
                  isCard: controller.isNewPassword.value,
                  focusNode: controller.focusNewPassword,
                  obscureText: controller.hide.value,
                  hintText: '*******',
                  labelText: StringConstants.newPassword,
                  hintTextColor: controller.isNewPassword.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.clickOnEyeButton(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Icon(
                          controller.hide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:text2Color,
                          size: 18.px,
                        )),
                      ],
                    ),
                  ),
                    margin: EdgeInsets.only(left: 20.px,right: 20.px)
                ),
                SizedBox(height: 10.px,),
                CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isPasswordValid(value: value),
                  controller: controller.cnfPasswordController,
                  isCard: controller.isCnfPassword.value,
                  focusNode: controller.focusCnfPassword,
                  obscureText: controller.hide.value,
                  hintText: '*******',
                  labelText: StringConstants.cnfPassword,
                  hintTextColor: controller.isCnfPassword.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.clickOnEyeButton(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Icon(
                          controller.hide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:text2Color,
                          size: 18.px,
                        )),
                      ],
                    ),
                  ),
                    margin: EdgeInsets.only(left: 20.px,right: 20.px)
                ),
                SizedBox(height: 20.px,),





              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}