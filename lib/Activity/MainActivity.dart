import 'package:attendance_app/Activity/ApplyLeaveActivity.dart';
import 'package:attendance_app/Activity/AttendanceActivity.dart';
import 'package:attendance_app/Activity/ProfileActivity.dart';
import 'package:attendance_app/Controller/AttendanceController.dart';
import 'package:attendance_app/apis/api_models/today_attendance_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/BottomBarController.dart';
import '../Controller/HomeController.dart';
import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<MainActivity> {
  BottomBarController bottomBarController = Get.put(BottomBarController());
  var pageList = [
    const HomeActivity(),
    const AttendanceActivity(),
    const ApplyLeaveActivity(),
    const ProfileActivity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationWidgets(),
        backgroundColor: primary3Color,
        body: Obx(() =>
            pageList[int.parse(bottomBarController.bottomNavIndex.string)]));
  }

  Widget bottomNavigationWidgets() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.px),
              topLeft: Radius.circular(15.px))),
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      elevation: 5.px,
      margin: EdgeInsets.symmetric(vertical: 0.px, horizontal: 5.px),
      child: Container(
        height: 60,
        // alignment: Alignment.bottomCenter,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      bottomBarController.changeBottomBarIndex(0);
                    },
                    child: bottomBarController.bottomNavIndex.value == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.homeIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                                color: primaryColor,
                              ),
                              Text(
                                StringConstants.home,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Container(
                                width: 50.px,
                                height: 2.px,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.px))),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.homeIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                StringConstants.home,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Get.delete<AttendanceController>();
                      bottomBarController.changeBottomBarIndex(1);
                    },
                    child: bottomBarController.bottomNavIndex.value == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.calendarIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                                color: primaryColor,
                              ),
                              Text(
                                StringConstants.attendance,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Container(
                                width: 50.px,
                                height: 2.px,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.px))),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.calendarIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                StringConstants.attendance,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomBarController.changeBottomBarIndex(2);
                      });
                    },
                    child: bottomBarController.bottomNavIndex.value == 2
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.chatIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                                color: primaryColor,
                              ),
                              Text(
                                StringConstants.leave,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Container(
                                width: 50.px,
                                height: 2.px,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.px))),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.chatIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                StringConstants.leave,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      bottomBarController.changeBottomBarIndex(3);
                    },
                    child: bottomBarController.bottomNavIndex.value == 3
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.profileIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                                color: primaryColor,
                              ),
                              Text(
                                StringConstants.profile,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                              Container(
                                width: 50.px,
                                height: 2.px,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.px))),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsConstants.profileIcon,
                                height: 20.px,
                                width: 20.px,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                StringConstants.profile,
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeActivity> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: primary3Color,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.px),
          child: Obx(() => controller.showLoadingBar.value
              ? Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(10.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.px)),
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
              : Obx(() => controller.showCheckInOutBtn.value
                  ? GestureDetector(
                      onTap: () {
                        controller.checkGpsStatus();
                        //checkGpsLocation();
                      },
                      child: Container(
                        height: 50.px,
                        margin: EdgeInsets.only(left: 20.px, right: 20.px),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.px)),
                            color: primaryColor),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsConstants.loginIcon,
                              fit: BoxFit.fill,
                              height: 25.px,
                              width: 25.px,
                            ),
                            SizedBox(
                              width: 5.px,
                            ),
                            Text(
                              StringConstants.checkIn,
                              style: MyTextStyle.titleStyle16bw,
                            )
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.checkGpsStatus();
                        //checkGpsLocation();
                      },
                      child: Container(
                        height: 50.px,
                        margin: EdgeInsets.only(left: 20.px, right: 20.px),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.px)),
                            color: const Color(0xffff7c74)),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsConstants.logoutIcon,
                              fit: BoxFit.fill,
                              height: 25.px,
                              width: 25.px,
                            ),
                            SizedBox(
                              width: 5.px,
                            ),
                            Text(
                              StringConstants.checkOut,
                              style: MyTextStyle.titleStyle16bw,
                            )
                          ],
                        ),
                      ),
                    ))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*   SafeArea(
              child: ListTile(
                leading: SizedBox(
                  height: 50.px, width: 50.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.px)),
                    child:CachedNetworkImage(
                      imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:50.px,height: 50.px,
                      placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 50.px,width: 50.px,),
                      errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:50.px,width:50.px ,),
                    ),
                  ),
                ),
                title: Text('Good Morning', style: MyTextStyle.titleStyle14b,),
                subtitle: Text(controller.userModel!.userData!.userName??'Alfredo Carder', style: MyTextStyle.titleStyle18bb,),
                trailing:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.px,
                      child: Text('jalkakjklak'),
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.openNotificationListActivity();
                      },
                        child: Image.asset(IconsConstants.notificationIcon,fit: BoxFit.fill,height: 25.px,width: 25.px,)),
                  ],
                ) ,
              ),
            ),*/
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                  left: 20.px, top: 20.px, right: 20.px, bottom: 10.px),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      child: SizedBox(
                        height: 50.px,
                        width: 50.px,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.px)),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${controller.userModel!.userData!.image!}',
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
                            errorWidget: (BuildContext context, String url,
                                    dynamic error) =>
                                Image.asset(
                              ImageConstants.girlImg,
                              fit: BoxFit.fill,
                              height: 50.px,
                              width: 50.px,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: MyTextStyle.titleStyle14b,
                            ),
                            Text(
                              controller.userModel!.userData!.userName ??
                                  'Alfredo Carder',
                              style: MyTextStyle.titleStyle18bb,
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 71.px,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HH:mm:ss',
                                style: MyTextStyle.titleStyle14bb,
                              ),
                              Obx(() => Text(
                                    controller.workingTime.value,
                                    style: MyTextStyle.titleStyle16bb,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.px,
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.openNotificationListActivity();
                            },
                            child: Image.asset(
                              IconsConstants.notificationIcon,
                              fit: BoxFit.fill,
                              height: 25.px,
                              width: 25.px,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.px, right: 15.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.px,
                        ),
                        Text(
                          StringConstants.todayAttendance,
                          style: MyTextStyle.titleStyle16bb,
                        ),
                        SizedBox(
                          height: 10.px,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.px)),
                                    side: BorderSide(
                                        color: controller.tabIndex.value == 1
                                            ? primaryColor
                                            : primary3Color,
                                        width: 1.px)),
                                elevation: controller.tabIndex.value == 1
                                    ? 4.px
                                    : 1.px,
                                child: InkWell(
                                  onTap: () {
                                    if ((controller.tabType == 'attendence' ||
                                            controller.tabType == 'lunch' ||
                                            controller.tabType ==
                                                'tea_break') &&
                                        controller.statusType == 'checkout') {
                                    } else {
                                      controller.changeTabIndex(
                                          'attendence', 'OFF');
                                    }
                                  },
                                  child: Container(
                                    height: 140.px,
                                    width: 155.px,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.px,
                                        ),
                                        ListTile(
                                          leading: SizedBox(
                                            height: 35.px,
                                            width: 35.px,
                                            child: Image.asset(
                                              IconsConstants.checkOutIcon,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          horizontalTitleGap: 3.px,
                                          title: Text(
                                            StringConstants.checkIn,
                                            style: MyTextStyle.titleStyle16bb,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller.printCrTime.value,
                                                  style: MyTextStyle
                                                      .titleStyle16bb,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Text(
                                                'On Time',
                                                style:
                                                    MyTextStyle.titleStyle12bl,
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.px)),
                                    side: BorderSide(
                                        color: controller.tabIndex.value == 2
                                            ? primaryColor
                                            : primary3Color,
                                        width: 1.px)),
                                elevation: controller.tabIndex.value == 2
                                    ? 5.px
                                    : 1.px,
                                child: InkWell(
                                  onTap: () {
                                    if (controller.tabType == 'attendence' &&
                                        controller.statusType == 'checkout') {
                                      controller.changeTabIndex(
                                          'attendence', 'NO');
                                    } else {}
                                  },
                                  child: Container(
                                    height: 135.px,
                                    width: 155.px,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5.px,
                                        ),
                                        ListTile(
                                          leading: SizedBox(
                                            height: 35.px,
                                            width: 35.px,
                                            child: Image.asset(
                                              IconsConstants.lunchTimeIcon,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          horizontalTitleGap: 3.px,
                                          title: Text(
                                            StringConstants.checkOut,
                                            style: MyTextStyle.titleStyle16bb,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5.px,
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller.printCrTime.value,
                                                  style: MyTextStyle
                                                      .titleStyle16bb,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.px,
                                              ),
                                              Text(
                                                'On Time',
                                                style:
                                                    MyTextStyle.titleStyle12bl,
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.px,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.px)),
                                    side: BorderSide(
                                        color: controller.tabIndex.value == 3
                                            ? primaryColor
                                            : primary3Color,
                                        width: 1.px)),
                                elevation: controller.tabIndex.value == 3
                                    ? 4.px
                                    : 1.px,
                                child: InkWell(
                                  onTap: () {
                                    if ((controller.tabType == 'attendence' ||
                                            controller.tabType == 'lunch' ||
                                            controller.tabType ==
                                                'tea_break') &&
                                        controller.statusType == 'checkout') {
                                    } else {
                                      controller.changeTabIndex('lunch', 'OFF');
                                    }
                                  },
                                  child: Container(
                                    height: 145.px,
                                    width: 155.px,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.px,
                                        ),
                                        ListTile(
                                          leading: SizedBox(
                                            height: 35.px,
                                            width: 35.px,
                                            child: Image.asset(
                                              IconsConstants.lunchTimeIcon,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          horizontalTitleGap: 3.px,
                                          title: Text(
                                            StringConstants.lunchTime,
                                            style: MyTextStyle.titleStyle16bb,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller.printCrTime.value,
                                                  style: MyTextStyle
                                                      .titleStyle16bb,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Text(
                                                'On Time (00:30 min)',
                                                style:
                                                    MyTextStyle.titleStyle12bl,
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.px)),
                                    side: BorderSide(
                                        color: controller.tabIndex.value == 4
                                            ? primaryColor
                                            : primary3Color,
                                        width: 1.px)),
                                elevation: controller.tabIndex.value == 4
                                    ? 4.px
                                    : 1.px,
                                child: InkWell(
                                  onTap: () {
                                    if ((controller.tabType == 'attendence' ||
                                            controller.tabType == 'lunch' ||
                                            controller.tabType ==
                                                'tea_break') &&
                                        controller.statusType == 'checkout') {
                                    } else {
                                      controller.changeTabIndex(
                                          'tea_break', 'OFF');
                                    }
                                  },
                                  child: Container(
                                    height: 140.px,
                                    width: 155.px,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.px,
                                        ),
                                        ListTile(
                                          leading: SizedBox(
                                            height: 35.px,
                                            width: 35.px,
                                            child: Image.asset(
                                              IconsConstants.teaBreakIcon,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          horizontalTitleGap: 3.px,
                                          title: Text(
                                            StringConstants.teaBreak,
                                            style: MyTextStyle.titleStyle16bb,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller.printCrTime.value,
                                                  style: MyTextStyle
                                                      .titleStyle16bb,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                              Text(
                                                'On Time (00:15 min)',
                                                style:
                                                    MyTextStyle.titleStyle12bl,
                                              ),
                                              SizedBox(
                                                height: 10.px,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      StringConstants.yourActivity,
                      style: MyTextStyle.titleStyle16bb,
                    ),
                    horizontalTitleGap: 5.px,
                    trailing: GestureDetector(
                        onTap: () {
                          controller.openAttendanceActivity();
                        },
                        child: const Text(
                          StringConstants.viewAll,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        )),
                  ),
                  Obx(() => controller.presentData.value
                      ? showYourActivity()
                      : const Text(
                          "There are not present today attendance.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.redAccent,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  SizedBox(
                    height: 20.px,
                  )
                ],
              ),
            ),

            /*  Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                // child:SizedBox() ,
              ),
            ),  */
          ],
        ));
  }

  /// Show Near Events...
  Widget showYourActivity() {
    return Obx(() => controller.showProgressbar.value
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showProgressbar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 10.px, bottom: 10.px),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 40.px,
                              width: 40.px,
                              margin: EdgeInsets.all(5.px),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15.px,
                                margin: EdgeInsets.only(
                                    left: 5.px,
                                    right: 5.px,
                                    bottom: 5.px,
                                    top: 5.px),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.black),
                              ),
                              Container(
                                height: 15.px,
                                width: 150.px,
                                margin: EdgeInsets.only(
                                    left: 5.px,
                                    right: 5.px,
                                    bottom: 5.px,
                                    top: 5.px),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 15.px,
                                margin: EdgeInsets.only(
                                    left: 5.px,
                                    right: 5.px,
                                    bottom: 5.px,
                                    top: 5.px),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.black),
                              ),
                              Container(
                                height: 15.px,
                                margin: EdgeInsets.only(
                                    left: 5.px,
                                    right: 5.px,
                                    bottom: 5.px,
                                    top: 5.px),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }))
        : ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.todayAttendanceModel!.result!.length,
            itemBuilder: (context, int index) {
              TodayAttendanceResult item =
                  controller.todayAttendanceModel!.result![index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px))),
                elevation: 2.px,
                margin: EdgeInsets.only(
                    right: 10.px, left: 10.px, top: 5.px, bottom: 5.px),
                child: ListTile(
                  leading: SizedBox(
                    height: 35.px,
                    width: 35.px,
                    child: Image.asset(
                      getIcon(item.checkType!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  horizontalTitleGap: 3.px,
                  title: Text(
                    item.checkType!,
                    style: MyTextStyle.titleStyle16bb,
                  ),
                  subtitle: Text(
                    item.date!,
                    style: MyTextStyle.titleStyle12blb,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('h:mm a').format(DateTime.parse(item.time!)),
                        style: MyTextStyle.titleStyle14bb,
                      ),
                      Text(
                        'On Time',
                        style: MyTextStyle.titleStyle12blb,
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
  }

  String getIcon(String checkType) {
    switch (checkType) {
      case 'attendence':
        {
          return IconsConstants.checkInIcon;
        }
      case 'lunch':
        {
          return IconsConstants.lunchTimeIcon;
        }
      case 'tea_break':
        {
          return IconsConstants.teaBreakIcon;
        }
    }
    return IconsConstants.checkInIcon;
  }
}
