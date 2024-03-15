import 'package:attendance_app/Controller/ProfileController.dart';
import 'package:attendance_app/Controller/ProfileDetailController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/iconsconstants.dart';

class ProfileDetailActivity extends StatefulWidget{
  const ProfileDetailActivity ({super.key});

  @override
  State<ProfileDetailActivity > createState() =>_ProfileDetailState();
}
class _ProfileDetailState  extends State<ProfileDetailActivity > {
  ProfileDetailController controller = Get.put(ProfileDetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
       controller.count.value;
       return  Scaffold(
         // backgroundColor: primary3Color,
           bottomNavigationBar: Padding(
             padding: EdgeInsets.only(bottom: 10.px),
             child: GestureDetector(
               onTap: (){
                 controller.openEditProfile();
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
                 child: Text(StringConstants.editProfile,style:MyTextStyle.titleStyle16bw,textAlign: TextAlign.center,),
               ),
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
                       child: Text(StringConstants.profile, style: MyTextStyle.titleStyle20bb,),
                     )),
                   ),
                 ),
               ),

               SizedBox(height: 10.px,),
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
               Text(controller.userModel!.userData!.userName??'James Donin', style: MyTextStyle.titleStyle16b,),
               Text(controller.userModel!.userData!.email??'James@gmail.com', style: MyTextStyle.titleStyle12b,),

               SizedBox(height: 10.px,),
               Container(
                   padding: EdgeInsets.only(left: 20.px,top: 10.px),
                   alignment: Alignment.centerLeft,
                   child: Text('Personal Info', style: MyTextStyle.titleStyle16bb,)),
               Container(
                 alignment:Alignment.centerLeft,
                 margin: EdgeInsets.only(left:30.px,right: 30.px,top: 10.px,bottom: 20.px),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Your Name', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.userName!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                     SizedBox(height: 10.px,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Gender', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.gender!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                     SizedBox(height: 10.px,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Company Name', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.companyName!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                     SizedBox(height: 10.px,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Your DOB', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.dob!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 10.px,),
               Container(
                   padding: EdgeInsets.only(left: 20.px,top: 10.px),
                   alignment: Alignment.centerLeft,
                   child: Text('Contact Info', style: MyTextStyle.titleStyle16bb,)),
               Container(
                 alignment:Alignment.centerLeft,
                 margin: EdgeInsets.only(left:30.px,right: 30.px,top: 10.px,bottom: 20.px),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Phone number', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.mobile!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                     SizedBox(height: 10.px,),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                       children: [
                         Text('Email', style: MyTextStyle.titleStyle14b,),
                         Text(controller.userModel!.userData!.email!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,),
                       ],
                     ),
                   ],
                 ),
               ),




             ],
           )

       );
    });
  }



}