import 'package:attendance_app/Controller/EditProfileController.dart';
import 'package:attendance_app/Controller/ProfileDetailController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Common/CommonWidget.dart';
import '../common/validations.dart';
import '../constant/iconsconstants.dart';

class EditProfileActivity extends StatefulWidget{
  const EditProfileActivity ({super.key});

  @override
  State<EditProfileActivity > createState() =>_EditProfileState();
}
class _EditProfileState  extends State<EditProfileActivity > {
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary3Color,
      resizeToAvoidBottomInset: false,
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
              if(controller.formKey.currentState!.validate()){
                controller.changeShowProgressBar(true);
                 controller.callingSubmitChangeProfileForm();
              }
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
                    child: Text(StringConstants.editProfile, style: MyTextStyle.titleStyle20bb,),
                  )),
                ),
              ),
            ),

            SizedBox(height: 10.px,),
            Stack(
              children: [
                SizedBox(
                  height: 120.px, width: 120.px,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.px),
                      child: Obx(() => controller.isSelectedFile.value?
                      Image.file(controller.selectedFile!, fit:BoxFit.cover,width:120.px,height: 120.px,):
                      CachedNetworkImage(
                        imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:120.px,height: 120.px,
                        placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 120.px,width: 120.px,),
                        errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:120.px,width:120.px ,),
                      ),
                      )
                  ),
                ),
                Positioned(
                  right: 0.px,bottom: 0.px,
                    child: InkWell(
                      onTap: (){
                        controller.getImage();
                      },
                      child: Icon(Icons.add_a_photo_rounded,size: 30.px,color: primaryColor,),
                    )
                )
              ],
            ),


            SizedBox(height: 10.px,),
            Container(
                padding: EdgeInsets.only(left: 20.px,top: 10.px),
                alignment: Alignment.centerLeft,
                child: Text('Personal Info', style: MyTextStyle.titleStyle16bb,)),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    alignment:Alignment.centerLeft,
                    margin: EdgeInsets.only(left:30.px,right: 30.px,top: 10.px,bottom: 20.px),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidget.commonTextField(
                              validator: (value)=>FormValidator.isEmptyValid(value: value),
                              controller: controller.fullNameController,
                              isCard: controller.isFullName.value,
                              focusNode: controller.focusFullName,
                              hintText: 'Jahn',
                              labelText: StringConstants.fullName,
                              keyboardType: TextInputType.name,
                              hintTextColor: controller.isFullName.value,
                          ),
                          SizedBox(height: 10.px,),
                          CommonWidget.commonTextField(
                            validator: (value) => FormValidator.isNumberValid(value: value),
                            controller: controller.mobileController,
                            isCard: controller.isMobile.value,
                            focusNode: controller.focusMobile,
                            hintText: StringConstants.mobileNumber,
                            labelText: StringConstants.mobileNumber,
                            keyboardType: TextInputType.name,
                            hintTextColor: controller.isMobile.value,
                          ),
                         /* SizedBox(height: 10.px,),
                          CommonWidget.commonTextField(
                              validator: (value) => FormValidator.isEmptyValid(value: value),
                              controller: controller.companyNameController,
                              isCard: controller.isCompanyName.value,
                              focusNode: controller.focusCompanyName,
                              hintText: StringConstants.companyName,
                              labelText: StringConstants.companyName,
                              keyboardType: TextInputType.name,
                              hintTextColor: controller.isCompanyName.value,
                          ),  */
                          SizedBox(height: 10.px,),
                          CommonWidget.commonTextField(
                              validator: (value) => FormValidator.isEmptyValid(value: value),
                              controller: controller.dobController,
                              isCard: controller.isDob.value,
                              readOnly: true,
                              focusNode: controller.focusDob,
                              hintText:StringConstants.dateOfBirth,
                              labelText: StringConstants.dateOfBirth,
                              hintTextColor: controller.isDob.value,
                              keyboardType: TextInputType.datetime,
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    openDatePickerBox(context);
                                  },
                                  icon: Image.asset(IconsConstants.calendarIcon,width: 25.px,height: 25.px,fit: BoxFit.fill,))
                          ),
                          SizedBox(height: 10.px,),
                          CommonWidget.commonTextField(
                              validator: (value) => FormValidator.isEmptyValid(value: value),
                              controller: controller.genderController,
                              isCard: controller.isGender.value,
                              readOnly: true,
                              focusNode: controller.focusGender,
                              hintText:StringConstants.selectGender,
                              labelText: StringConstants.selectGender,
                              hintTextColor: controller.isGender.value,
                              keyboardType: TextInputType.name,
                          ),
                   /*     Card(
                            elevation: 1 ,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.px),
                                side: BorderSide(width: 1.px,color: primaryColor)

                            ),
                            color: primary3Color,
                            shadowColor:primaryColor,
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Select Gender',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.genderController.text,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),),
                                    DropdownButton<String>(
                                      items: <String>['Male', 'Female',].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value??'Male',
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        controller.genderController.value=TextEditingValue(text:newValue! );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )  */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        )

    );
  }

  /// Show Date Picker Box...
  void openDatePickerBox(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-100.px,
            padding: EdgeInsets.all(10.px),
            child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                ),
                value: controller.selectDates,
                onValueChanged: (dates) {
                  controller.changeSelectedDates(dates);
                }
            )
        ),
        alignment: Alignment.center,

      ),
    );

  }

}