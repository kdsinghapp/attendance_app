
import 'package:attendance_app/Controller/AttendanceController.dart';
import 'package:attendance_app/Controller/ChatController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:attendance_app/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';


class ChatActivity extends StatefulWidget{
  const ChatActivity({super.key});

  @override
  State<ChatActivity> createState() =>_ChatState();
}
class _ChatState extends State<ChatActivity> {
  ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primary3Color,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.px,top: 20.px),
                child:Text(StringConstants.teamMembers, style: MyTextStyle.titleStyle24bb,),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.px),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              elevation: 0.px,
              color: cartColor,
              margin: EdgeInsets.all(20.px),
              child: GestureDetector(
                onTap: () {},
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'FontBold',
                  ),
                  controller: controller.searchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0.px, horizontal: 10.0.px),
                    hintText: 'Search here...',
                    hintStyle: MyTextStyle.titleStyle16b,
                    prefixIcon:Icon(Icons.search_rounded, size: 25.px,),


                  ),
                  onChanged: (text) {
                    controller.changeFilterUsersList(controller.searchController.text);
                  },

                ),
              ),
            ),
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
  }

  /// Show Near Events...
  Widget showNearEvents() {
    return GetBuilder<ChatController>(builder: (context) {
    return Obx(() =>
    controller.showProgressbar.value ?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showProgressbar.value,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 180.px,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 170.px, width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5),
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
    ) :
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.filterUsersList.length,
      itemBuilder: (context, int index) {
        // GetClubsResult item=controller.getClubsModel!.result![index];
        return GestureDetector(
          onTap: () {
            controller.openTypingPage();
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            elevation: 0.px,
            margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 5.px),

            child: ListTile(
              leading: SizedBox(
                height: 50.px, width: 50.px,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.px)),
                  child:Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,height: 50.px,),
                ),
              ),
              title: Text(controller.filterUsersList[index], style: MyTextStyle.titleStyle14bb,),
              subtitle: Text('Johan Smihs', style: MyTextStyle.titleStyle12b,),
              trailing: Text('10:30 AM', style: MyTextStyle.titleStyle12b,),
            ),
          ),
        );
      },
    )
    );

  });
  }


}