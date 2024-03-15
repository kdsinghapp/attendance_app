
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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:EdgeInsets.all(20.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.px,),
              SizedBox(
                height: 100.px,width: 150.px,
                child: Image.asset(ImageConstants.splashImg,fit: BoxFit.fill,),
              ),
              SizedBox(height: 20.px,),
              Text(StringConstants.welcomeTo,style: MyTextStyle.titleStyle30bb,),
              SizedBox(height: 5.px,),
              Text(StringConstants.helloThereLoginToContinue,style: MyTextStyle.titleStyle14b,),
              SizedBox(height: 30.px,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        validator: (value) => FormValidator.isEmptyValid(value: value),
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
                        if(controller.formKey.currentState!.validate()){
                          controller.changeProgressbarStatus(true);
                          controller.callingSubmitLogInForm();
                        }
                      }
                          ,text: StringConstants.login,
                          buttonMargin: EdgeInsets.all(10.px),
                          borderRadius: 30.px,
                          height: 60.px),
                      ),

                      SizedBox(height: 10.px,),
                    ],
                  ),
                ),
              ),





            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}