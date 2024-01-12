


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';

class CommonWidget{

  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }


  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton(
      {double? height,
        double? width,
        EdgeInsetsGeometry? buttonMargin,
        EdgeInsetsGeometry? contentPadding,
        double? borderRadius,
        Color? splashColor,
        bool wantContentSizeButton = false,
        Color? buttonColor,
        TextStyle? textStyle,
        double? elevation,
        String? text,
        required VoidCallback onPressed,
        //required Widget child
      }) {
    return Container(
      height: wantContentSizeButton ? height : 50.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
        color: primaryColor
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle: textStyle ??
              Theme.of(Get.context!)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
          ),
          backgroundColor: buttonColor ?? primaryColor,
          foregroundColor: splashColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        child:Text(text??'Done',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: primary3Color),),
      ),
    );
  }


   /// TextFieldForm  Widget .....
  static Widget commonTextField(
      {double? elevation,
        String? hintText,
        String? labelText,
        String? errorText,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? contentPadding,
        TextEditingController? controller,
        int? maxLines,
        double? cursorHeight,
        bool wantBorder = false,
        ValueChanged<String>? onChanged,
        FormFieldValidator<String>? validator,
        Color? fillColor,
        Color? initialBorderColor,
        double? initialBorderWidth,
        TextInputType? keyboardType,
        double? borderRadius,
        double? maxHeight,
        TextStyle? hintStyle,
        TextStyle? style,
        TextStyle? labelStyle,
        TextStyle? errorStyle,
        List<TextInputFormatter>? inputFormatters,
        TextCapitalization textCapitalization = TextCapitalization.none,
        bool autofocus = false,
        bool readOnly = false,
        bool hintTextColor = false,
        Widget? suffixIcon,
        Widget? prefixIcon,
        AutovalidateMode? autoValidateMode,
        int? maxLength,
        GestureTapCallback? onTap,
        bool obscureText = false,
        Iterable<String>? autofillHint,
        FocusNode? focusNode,
        bool? filled,
        bool isCard = false}) {
    return Card(
      elevation: isCard ? 1 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.px),
        side: BorderSide(width: 1.px,color: primaryColor)

      ),
      color: primary3Color,
      shadowColor:primaryColor,
      margin: margin,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.only(top:7.px),
        child: TextFormField(
          focusNode: focusNode,
          obscureText: obscureText,
          autofillHints:autofillHint ,
          onTap: onTap,
          maxLength: maxLength,
          maxLines: maxLines??1,
          cursorHeight: cursorHeight,
          cursorColor: Theme.of(Get.context!).primaryColor,
          autovalidateMode: autoValidateMode,
          controller: controller,
          onChanged: onChanged ??
                  (value) {
                value = value.trim();
                if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                  controller?.text = "";
                }
              },
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.streetAddress,
          readOnly: readOnly,
          autofocus: autofocus,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          style: style ??TextStyle(fontSize: 14.px,fontWeight: FontWeight.w400,color: textColor),
          decoration: InputDecoration(
            errorText: errorText,
            counterText: '',
            errorStyle: errorStyle ??
                Theme.of(Get.context!)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(Get.context!).colorScheme.error),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
            fillColor: fillColor ?? primary3Color,
            filled: filled ?? true,
            contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 20.px,vertical: 0.px),
            hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: text2Color),
            labelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: primaryColor),
            disabledBorder: OutlineInputBorder(
              borderSide: wantBorder
                  ? BorderSide(
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  width: 2.px)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(
                borderRadius ?? 15.px,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: wantBorder
                    ? BorderSide(
                    color: Theme.of(Get.context!).primaryColor, width: 2.px)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),
            enabledBorder: OutlineInputBorder(
                borderSide: wantBorder
                    ? BorderSide(
                    color: initialBorderColor ??textColor,
                    width: initialBorderWidth ?? 2.px)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),
            errorBorder: OutlineInputBorder(
                borderSide: wantBorder
                    ? BorderSide(
                    color: Theme.of(Get.context!).colorScheme.onError,
                    width: 2.px)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),

          ),
        ),
      ),
    );
  }


  ///For Simmer for loading time
  static Widget commonShimmer(
      {double? height,
        double? width,
        EdgeInsetsGeometry? buttonMargin,
        EdgeInsetsGeometry? contentPadding,
        double? borderRadius,
        Color? buttonColor,
        int itemCount=1,
        bool enabled=true,
        required Widget shimmerWidget,
        //required Widget child
      }) {
    return
      Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          enabled: enabled,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemCount,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return shimmerWidget;
              }
          )
      );
  }



  ///For Check Post Api Response
  static Future<bool> responseCheckForPostMethod(
      {http.Response? response}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  static void networkConnectionShowSnackBar() {
    showSnackBar(
        message: "Check Your Internet Connection", context: Get.context!);
  }
  static void showSnackBar(
      {required String message, BuildContext? context, Duration? duration}) {
    /*var snackBar = SnackBar(
      elevation: 4,
      backgroundColor: Theme.of(Get.context!).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.px),
        side: BorderSide(color: Theme.of(Get.context!).primaryColor),
      ),
      content: Text(
        message,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontSize: 12.px,
            color: Theme.of(Get.context!).scaffoldBackgroundColor),
      ),
       margin: EdgeInsets.only(left: 8.px, right: 6.px, bottom: 40.px),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);*/
  }



  ///For Check Get Api Response
  static Future<bool> responseCheckForGetMethod(
      {http.Response? response,
        bool wantSuccessToast = false,
        bool wantErrorToast = true,}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null &&
        response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}