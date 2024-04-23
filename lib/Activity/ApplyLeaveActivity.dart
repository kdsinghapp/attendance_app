import 'package:attendance_app/Controller/ApplyLeaveController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/common/ShowToast.dart';
import 'package:attendance_app/common/validations.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Common/CommonWidget.dart';
import '../Tool/MyTextStyle.dart';

class ApplyLeaveActivity extends StatefulWidget {
  const ApplyLeaveActivity({super.key});

  @override
  State<ApplyLeaveActivity> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeaveActivity> {
  ApplyLeaveController controller = Get.put(ApplyLeaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary3Color,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: ListTile(
              leading: SizedBox(
                height: 50.px,
                width: 50.px,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25.px)),
                  child: CachedNetworkImage(
                    imageUrl: '${controller.userModel!.userData!.image!}',
                    fit: BoxFit.cover,
                    width: 50.px,
                    height: 50.px,
                    placeholder: (BuildContext context, String url) =>
                        Image.asset(
                      ImageConstants.girlImg,
                      fit: BoxFit.fill,
                      height: 50.px,
                      width: 50.px,
                    ),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) =>
                            Image.asset(
                      ImageConstants.girlImg,
                      fit: BoxFit.fill,
                      height: 50.px,
                      width: 50.px,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Good Morning',
                style: MyTextStyle.titleStyle14b,
              ),
              subtitle: Text(
                controller.userModel!.userData!.userName ?? 'Alfredo Carder',
                style: MyTextStyle.titleStyle18bb,
              ),
            ),
          ),
          SizedBox(
            height: 5.px,
          ),
          Text(
            StringConstants.applyForLeave,
            style: MyTextStyle.titleStyle24bb,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  margin: EdgeInsets.all(20.px),
                  clipBehavior: Clip.hardEdge,
                  elevation: 5.px,
                  child: CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    value: controller.dates,
                    onValueChanged: (dates) {
                      controller.dates = dates;
                      controller.changeDateLength();
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.px, right: 20.px, top: 10.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => controller.dateLength.value >= 2
                          ? Text(
                              controller.dates[0].toString().substring(0, 10) +
                                  " to " +
                                  controller
                                      .dates[controller.dateLength.value - 1]
                                      .toString()
                                      .substring(0, 10),
                              style: MyTextStyle.titleStyle16bb,
                            )
                          : Text(
                              controller.dates[0].toString().substring(0, 10),
                              style: MyTextStyle.titleStyle16bb,
                              textAlign: TextAlign.start,
                            )),
                      SizedBox(
                        height: 5.px,
                      ),
                      CommonWidget.commonTextField(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.reasonController,
                          isCard: true,
                          // hintText: 'Write Reason',
                          labelText: 'Reason',
                          hintTextColor: true,
                          maxLines: 5),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.px,
                ),
                Obx(() => controller.showProgressBar.value
                    ? Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.all(10.px),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.px)),
                            color: primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: primary3Color,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Loading...",
                              style: MyTextStyle.titleStyle16bw,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CommonWidget.commonElevatedButton(
                            onPressed: () {
                              if (controller.reasonController.text.isNotEmpty) {
                                controller.clickOnLeaveButton();
                              } else {
                                showToastMessage('Enter reason ...');
                              }
                            },
                            text: StringConstants.applyForLeave,
                            buttonMargin: EdgeInsets.only(
                                left: 20.px, right: 20.px, bottom: 5.px),
                            borderRadius: 30.px,
                            height: 60.px),
                      )),
                SizedBox(
                  height: 20.px,
                ),
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
