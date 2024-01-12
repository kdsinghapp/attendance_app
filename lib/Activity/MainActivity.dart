
import 'package:attendance_app/Activity/AttendanceActivity.dart';
import 'package:attendance_app/Activity/ChatActivity.dart';
import 'package:attendance_app/Activity/ProfileActivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/BottomBarController.dart';
import '../Controller/HomeController.dart';
import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../common/mylocation.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';
class MainActivity extends StatefulWidget{
  const MainActivity({super.key});


  @override
  State<StatefulWidget> createState() =>_MainState();
}

class _MainState extends State<MainActivity>{
  BottomBarController bottomBarController=Get.put(BottomBarController());
  var pageList=[
    const HomeActivity(),
    const AttendanceActivity(),
    const ChatActivity(),
    const ProfileActivity(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        bottomNavigationBar: bottomNavigationWidgets(),
        backgroundColor: primary3Color,
        body:Obx(()=>pageList[int.parse(bottomBarController.bottomNavIndex.string)])
    );
  }

  Widget bottomNavigationWidgets(){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px))
      ),
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      elevation: 5.px,
      margin: EdgeInsets.symmetric(vertical: 0.px,horizontal: 5.px),
      child: Container(
        height: 60,
       // alignment: Alignment.bottomCenter,
        child: Obx(()=>
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        bottomBarController.changeBottomBarIndex(0);
                      },
                      child:bottomBarController.bottomNavIndex.value==0?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.homeIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,color: primaryColor,),
                          Text(StringConstants.home,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                          Container(width: 50.px,height: 2.px,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(1.px))
                            ),
                          )
                        ],
                      ):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.homeIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,),
                          Text(StringConstants.home,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        bottomBarController.changeBottomBarIndex(1);
                      },
                      child:bottomBarController.bottomNavIndex.value==1?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.calendarIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,color: primaryColor,),
                        Text(StringConstants.attendance,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                          Container(width: 50.px,height: 2.px,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(1.px))
                            ),
                          )
                        ],
                      ):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.calendarIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,),
                          Text(StringConstants.attendance,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          bottomBarController.changeBottomBarIndex(2);
                        });
                      },
                      child:bottomBarController.bottomNavIndex.value==2? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset(IconsConstants.chatIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,color: primaryColor,),
                          Text(StringConstants.chat,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                          Container(width: 50.px,height: 2.px,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(1.px))
                            ),
                          )
                        ],
                      ):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.chatIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,),
                          Text(StringConstants.chat,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        bottomBarController.changeBottomBarIndex(3);
                      },
                      child:bottomBarController.bottomNavIndex.value==3? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.profileIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,color: primaryColor,),
                          Text(StringConstants.profile,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                          Container(width: 50.px,height: 2.px,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(1.px))
                            ),
                          )
                        ],
                      ):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.profileIcon,height: 20.px,width: 20.px,fit: BoxFit.fill,),
                           Text(StringConstants.profile,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
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

class HomeActivity extends StatefulWidget{
  const HomeActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_HomeState();
}
class _HomeState extends State<HomeActivity>{
  HomeController controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
       // backgroundColor: primary3Color,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.px),
          child: Obx(()=>controller.showLoadingBar.value?
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
          Obx(() =>
              controller.showCheckInOutBtn.value?
              GestureDetector(
                onTap: (){
                  controller.checkGpsStatus();
                  //checkGpsLocation();
                },
                child: Container(
                  height: 50.px,
                  margin: EdgeInsets.only(left: 20.px,right: 20.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.px)),
                      color: primaryColor
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(IconsConstants.loginIcon,fit: BoxFit.fill,height: 25.px,width: 25.px,) ,
                      SizedBox(width: 5.px,),
                      Text(StringConstants.checkIn,style:MyTextStyle.titleStyle16bw,)
                    ],
                  ),
                ),
              ):
              GestureDetector(
                onTap: (){
                  controller.checkGpsStatus();
                  //checkGpsLocation();
                },
                child: Container(
                  height: 50.px,
                  margin: EdgeInsets.only(left: 20.px,right: 20.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.px)),
                      color: const Color(0xffff7c74)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(IconsConstants.logoutIcon,fit: BoxFit.fill,height: 25.px,width: 25.px,) ,
                      SizedBox(width: 5.px,),
                      Text(StringConstants.checkOut,style:MyTextStyle.titleStyle16bw,)
                    ],
                  ),
                ),
              )
          )
         ),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: ListTile(
                leading: SizedBox(
                  height: 50.px, width: 50.px,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.px)),
                    child:Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 50.px,),
                  ),
                ),
                title: Text('Good Morning', style: MyTextStyle.titleStyle14b,),
                subtitle: Text('Alfredo Carder', style: MyTextStyle.titleStyle18bb,),
                trailing:GestureDetector(
                  onTap: (){
                    controller.openNotificationListActivity();
                  },
                    child: Image.asset(IconsConstants.notificationIcon,fit: BoxFit.fill,height: 25.px,width: 25.px,)) ,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.px,right: 15.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.px,),
                  Text(StringConstants.todayAttendance, style: MyTextStyle.titleStyle16bb,),
                  SizedBox(height: 20.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.px)),
                       ),
                       elevation: 2.px,
                       child:Container(
                         height: 140.px,width: 155.px,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 10.px,),
                             ListTile(
                               leading: SizedBox(
                                 height: 35.px, width: 35.px,
                                 child: Image.asset(IconsConstants.checkOutIcon,fit: BoxFit.fill,),
                               ),
                               horizontalTitleGap: 3.px,
                               title: Text(StringConstants.checkIn, style: MyTextStyle.titleStyle16bb,),
                             ),
                             Padding(
                                 padding: EdgeInsets.only(left: 20.px),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: 10.px,),
                                   Text('10:00 am', style: MyTextStyle.titleStyle16bb,),
                                   SizedBox(height: 10.px,),
                                   Text('On Time', style: MyTextStyle.titleStyle12bl,),
                                   SizedBox(height: 10.px,),
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                        ),
                        elevation: 2.px,
                        child:Container(
                          height: 140.px,width: 155.px,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.px,),
                              ListTile(
                                leading: SizedBox(
                                  height: 35.px, width: 35.px,
                                  child: Image.asset(IconsConstants.lunchTimeIcon,fit: BoxFit.fill,),
                                ),
                                horizontalTitleGap: 3.px,
                                title: Text(StringConstants.checkOut, style: MyTextStyle.titleStyle16bb,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.px,),
                                    Text('7:30 pm', style: MyTextStyle.titleStyle16bb,),
                                    SizedBox(height: 10.px,),
                                    Text('On Time', style: MyTextStyle.titleStyle12bl,),
                                    SizedBox(height: 10.px,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                        ),
                        elevation: 2.px,
                        child:Container(
                          height: 140.px,width: 155.px,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.px,),
                              ListTile(
                                leading: SizedBox(
                                  height: 35.px, width: 35.px,
                                  child: Image.asset(IconsConstants.lunchTimeIcon,fit: BoxFit.fill,),
                                ),
                                horizontalTitleGap: 3.px,
                                title: Text(StringConstants.lunchTime, style: MyTextStyle.titleStyle16bb,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.px,),
                                    Text('00:30 min', style: MyTextStyle.titleStyle16bb,),
                                    SizedBox(height: 10.px,),
                                    Text('On Time', style: MyTextStyle.titleStyle12bl,),
                                    SizedBox(height: 10.px,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                        ),
                        elevation: 2.px,
                        child:Container(
                          height: 140.px,width: 155.px,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.px,),
                              ListTile(
                                leading: SizedBox(
                                  height: 35.px, width: 35.px,
                                  child: Image.asset(IconsConstants.teaBreakIcon,fit: BoxFit.fill,),
                                ),
                                horizontalTitleGap: 3.px,
                                title: Text(StringConstants.teaBreak, style: MyTextStyle.titleStyle16bb,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.px,),
                                    Text('00:15 min', style: MyTextStyle.titleStyle16bb,),
                                    SizedBox(height: 10.px,),
                                    Text('On Time', style: MyTextStyle.titleStyle12bl,),
                                    SizedBox(height: 10.px,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title:Text(StringConstants.yourActivity,style: MyTextStyle.titleStyle16bb,),
              horizontalTitleGap: 5.px,
              trailing: GestureDetector(
                onTap: (){

                },
                  child: const Text(StringConstants.viewAll, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: primaryColor),)),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showNearEvents() ,
               // child:SizedBox() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Near Events...
  Widget showNearEvents(){
    return Obx(() =>controller.showProgressbar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showProgressbar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 180.px,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 170.px,width: double.infinity,
                      margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: textColor
                      ),
                    ),
                  ],
                ),
              );
            }
        )
    ):
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.type.length,
      itemBuilder: (context, int index) {
       // GetClubsResult item=controller.getClubsModel!.result![index];
        return GestureDetector(
          onTap: () {
           // controller.openClubAllEventActivity(item.id!,item.fullName!);
          },
          child:Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.px))
             ),
            elevation: 2.px,
            margin: EdgeInsets.all(10.px),
            child: ListTile(
              leading: SizedBox(
                height: 35.px, width: 35.px,
                child: Image.asset(controller.icon[index],fit: BoxFit.fill,),
              ),
              horizontalTitleGap: 3.px,
              title: Text(controller.type[index], style: MyTextStyle.titleStyle16bb,),
              subtitle: Text('Dec 28,2023', style: MyTextStyle.titleStyle12blb,),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.time[index], style: MyTextStyle.titleStyle16bb,),
                  Text('On Time', style: MyTextStyle.titleStyle12blb,),
                ],
              ),

            ),
          ),
        );
      },
    )
    );
  }


  void checkGpsLocation() async {
    print('Checking Start....');
  /*  Location location = Location();
    bool isGpsOn = await location.serviceEnabled();
    if (!isGpsOn) { //if defvice is off
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        print("GPS device is turned ON");
      } else {
        print("GPS Device is still OFF");
      }
    }else{
      print('Distable...');
    }  */

    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        controller.changeChangeGpsStatus(_serviceEnabled);
        print('status'+_serviceEnabled.toString());
      }else{
        controller.changeChangeGpsStatus(_serviceEnabled);
        print('status'+_serviceEnabled.toString());
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('permission'+_serviceEnabled.toString());
      }else{
        print('permission'+_serviceEnabled.toString());
      }
    }
  }




}