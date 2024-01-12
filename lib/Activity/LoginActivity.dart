
import 'package:attendance_app/Activity/SignUpActivity.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/LoginController.dart';
import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../common/validations.dart';
import '../constant/stringconstants.dart';
class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginState();
}

class _LoginState extends State<LoginActivity> {
  LoginController controller=Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor:primary3Color ,
        bottomNavigationBar:Container(
          height: 50.px,
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () {
              controller.goToSignUpActivity();
            },
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    //apply style to all
                    children: [
                      TextSpan(
                          text: 'Don’t have an account yet? ',
                          style: TextStyle(color: Colors.black54)),
                      TextSpan(
                          text: ' Sign up',
                          style: TextStyle(
                              fontSize: 16, color:Colors.orangeAccent)),
                    ])),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding:EdgeInsets.all(20.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 70.px,),
                    SizedBox(
                      height: 100.px,width: 150.px,
                      child: Image.asset(ImageConstants.splashImg,fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 20.px,),
                    Text(StringConstants.welcomeTo,style: MyTextStyle.titleStyle30bb,),
                    SizedBox(height: 5.px,),
                    Text(StringConstants.helloThereLoginToContinue,style: MyTextStyle.titleStyle14b,),
                    SizedBox(height: 30.px,),
                    CommonWidget.commonTextField(
                        validator: (value)=>FormValidator.isEmailValid(value: value),
                        controller: controller.emailPhoneController,
                        autofillHint: const [AutofillHints.email],
                        isCard: controller.isEmail.value,
                        focusNode: controller.focusEmail,
                        hintText: StringConstants.email,
                        labelText: StringConstants.email,
                        hintTextColor: controller.isEmail.value,
                    ),
                    SizedBox(height: 10.px,),
                    CommonWidget.commonTextField(
                      validator: (value) => FormValidator.isPasswordValid(value: value),
                      controller: controller.passwordController,
                      isCard: controller.isPassword.value,
                      focusNode: controller.focusPassword,
                      obscureText: controller.hide.value,
                      hintText: '*******',
                      labelText: StringConstants.password,
                      hintTextColor: controller.isEmail.value,
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
                              color: controller.isPassword.value
                                  ? text2Color
                                  : text2Color,
                              size: 18.px,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px,),
                    Align(
                      child: GestureDetector(
                        onTap: (){
                          controller.openResetPasswordActivity();
                        },
                        child: SizedBox(
                          width: 130.px,
                          child: Text(StringConstants.forgotYourPassword,style: MyTextStyle.titleStyle12blb,),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.px,),
                     Obx(() => controller.showProgressbar.value?
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
                     CommonWidget.commonElevatedButton(onPressed: (){
                       controller.openHomeActivity();

                     }
                         ,text: StringConstants.login,
                         buttonMargin: EdgeInsets.all(10.px),
                         borderRadius: 30.px,
                         height: 60.px),
                       ),

                    SizedBox(height: 10.px,),
                   /* Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          controller.goToSignUpActivity();
                        },
                        child: RichText(
                            text:  TextSpan(
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: 'Do not have an account? ',
                                      style: TextStyle(color: text2Color,fontWeight: FontWeight.w400,fontSize: 14.px)),
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: MyTextStyle.titleStyle16bb),
                                ])),
                      ),
                    ),*/



                  ],
                ),
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}