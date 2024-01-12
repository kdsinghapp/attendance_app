
import 'package:attendance_app/Controller/TypingController.dart';
import 'package:attendance_app/Tool/Color.dart';
import 'package:attendance_app/Tool/MyTextStyle.dart';
import 'package:attendance_app/constant/iconsconstants.dart';
import 'package:attendance_app/constant/imageconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class TypingActivity extends StatefulWidget{
  const TypingActivity({super.key});

  @override
  State<TypingActivity> createState() => _TypingState();
}
class _TypingState extends State<TypingActivity> {
  TypingController controller=Get.put(TypingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child:Container(
          height: 60,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: cartColor,
          ),
          child: Row(
            children: [

              Expanded(
                  flex: 5,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'FontBold',
                    ),
                    controller: controller.searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration:const  InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      hintText: "Type Message...",
                      hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'FontBold', color: Colors.black87),

                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Image.asset(IconsConstants.sendIcon,height: 50.px,width: 50.px,fit: BoxFit.fill,)
              ),

            ],
          ),
        ),
      ),
      body:  Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color:primary3Color
            ),
            padding:  const EdgeInsets.only(top: 40,bottom: 10),
            child: Column(
              children: [
                //  CommonWidgets.appBarView(title: StringConstants.profile),
                ListTile(
                  leading: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: SizedBox(
                      height: 40.px, width: 40.px,
                      child: Image.asset(IconsConstants.backIcon,fit: BoxFit.fill,),
                    ),
                  ),
                  title:
                  Row(
                    children: [
                      SizedBox(
                        height: 30.px,width: 30.px,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.px),
                            child: Image.asset(ImageConstants.girlImg,fit: BoxFit.fill,)),
                      ),
                      SizedBox(width: 5.px,),
                      Text("Jenny Wilson",style: MyTextStyle.titleStyle14bb,),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: chating(),
              ),
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }

  Widget chating(){
    return
      ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index){
          return index%2==0?
          Align(
            alignment:Alignment.topLeft,
            child: receivingMessage(),
          ):Container(
            alignment:Alignment.topRight,
            child: senderMessage(),
          );
        },);
  }
  Widget senderMessage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
            flex: 2,
            child: SizedBox()
        ),
        Expanded(
          flex: 3,
          child:  Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text("Lorem ipsum dolor sit amet consectetur. Quam molestie at.",style: MyTextStyle.titleStyle14bb,
              textAlign: TextAlign.start,),
          ),

        ),
         Expanded(
          flex: 1,
          child: SizedBox(
            height: 40,width: 40,
            child: Text('08:21',style: MyTextStyle.titleStyle12bb,),
          ),
        ),
      ],
    );
  }
  Widget receivingMessage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 40,width: 40,
            child: Text('08:21',style: MyTextStyle.titleStyle12bb,textAlign: TextAlign.end,),
          ),
        ),
        Expanded(
          flex: 3,
          child:  Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text("Hii Arvind how are you ? what are doing this time...",style: MyTextStyle.titleStyle14bw,
              textAlign: TextAlign.start,),
          ),

        ),
        const Expanded(
            flex: 2,
            child: SizedBox()
        ),


      ],
    );
  }
}