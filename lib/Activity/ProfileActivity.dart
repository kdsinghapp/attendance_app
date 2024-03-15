import 'package:attendance_app/Controller/ChatController.dart';
import 'package:attendance_app/Controller/ProfileController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileActivity extends StatefulWidget{
  const ProfileActivity({super.key});

  @override
  State<ProfileActivity> createState() =>_ProfileState();
}
class _ProfileState extends State<ProfileActivity> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        // backgroundColor: primary3Color,
          body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                  child: SizedBox(height: 20.px,)
              ),
              SizedBox(
                height: 120.px, width: 120.px,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.px),
                  child: CachedNetworkImage(
                    imageUrl:'${controller.userModel!.userData!.image!}', fit:BoxFit.cover,width:120.px,height: 120.px,
                    placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 120.px,width: 120.px,),
                    errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height:120.px,width:120.px ,),
                  ),
                ),
              ),
              Text(controller.userModel!.userData!.userName??'', style: MyTextStyle.titleStyle16b,),
              Text(controller.userModel!.userData!.email??'', style: MyTextStyle.titleStyle12b,),
              SizedBox(height: 20.px,),
              GestureDetector(
                onTap: (){
                  controller.openEditProfile();
                },
                child: Container(
                  height: 50.px,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20.px,right: 20.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.px)),
                      color: primaryColor
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Text(StringConstants.editProfile,style:MyTextStyle.titleStyle16bw,textAlign: TextAlign.center,),
                ),
              ),
              SizedBox(height: 10.px,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: showNearEvents(),
                  // child:SizedBox() ,
                ),
              ),


            ],
          )

      );
    });
  }

  /// Show Near Events...
  Widget showNearEvents() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.list.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(left:20.px,right: 20.px),

          child: Column(
            children: [
              ListTile(
                onTap: (){
                  controller.openNextPages(index);
                },
                leading: SizedBox(
                  height: 40.px, width: 40.px,
                  child: Image.asset(controller.icon[index],fit: BoxFit.fill,),
                ),
                title: Text(controller.list[index], style: MyTextStyle.titleStyle14bb,),
                trailing: Icon(Icons.keyboard_arrow_right,size: 25.px,),
              ),
              Divider(color:const Color(0xFFDADADA),thickness: 1.px,indent: 10.px,endIndent: 10.px,)
            ],
          ),
        );
      },
    );
  }


}