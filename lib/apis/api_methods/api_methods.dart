

import 'dart:io';

import 'package:attendance_app/Activity/EditProfileActivity.dart';
import 'package:attendance_app/apis/api_models/add_attendence_model.dart';
import 'package:attendance_app/apis/api_models/add_leave_model.dart';
import 'package:attendance_app/apis/api_models/change_password_model.dart';
import 'package:attendance_app/apis/api_models/edit_profile_model.dart';
import 'package:attendance_app/apis/api_models/get_datewisedata_model.dart';
import 'package:attendance_app/apis/api_models/get_notification_model.dart';
import 'package:attendance_app/apis/api_models/get_privacypolicy_model.dart';
import 'package:attendance_app/apis/api_models/get_termcondition_model.dart';
import 'package:attendance_app/apis/api_models/get_usertimecount_model.dart';
import 'package:attendance_app/apis/api_models/getall_attendance_model.dart';
import 'package:attendance_app/apis/api_models/today_attendance_model.dart';

import '../../Common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_models/get_leavestatus_model.dart';
import '../api_models/user_model.dart';


class ApiMethods {
  /// Login Api Calling .....
  static Future<UserModel?> submitLoginForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }
  /// Get Profile Api Calling .....
  static Future<UserModel?> getProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }
  /// Get Total Working Hours Api Calling .....
  static Future<GetUserCountTimeModel?> getTotalWorkingHoursApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetUserCountTimeModel? getUserCountTimeModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetTotalWorkingHours,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getUserCountTimeModel = GetUserCountTimeModel.fromJson(jsonDecode(response.body));
      return getUserCountTimeModel;
    }
    return null;
  }

  /// Add Attendance Api Calling .....
  static Future<AddAttendanceModel?> addAttendanceApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddAttendanceModel? addAttendanceModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddAttendance,
      checkResponse: checkResponse,
    );
    if (response != null) {
      addAttendanceModel = AddAttendanceModel.fromJson(jsonDecode(response.body));
      return addAttendanceModel;
    }
    return null;
  }


  /// Add Leave  Api Calling .....
  static Future<AddLeaveModel?> addLeaveApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddLeaveModel? addLeaveModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddLeaveAccount,
      checkResponse: checkResponse,
    );
    if (response != null) {
      addLeaveModel = AddLeaveModel.fromJson(jsonDecode(response.body));
      return addLeaveModel;
    }
    return null;
  }

  /// Get Leave Status List Api Calling .....
  static Future<GetLeaveStatusModel?> getLeaveStatusApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetLeaveStatusModel? getLeaveStatusModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetLeaveStatusList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getLeaveStatusModel = GetLeaveStatusModel.fromJson(jsonDecode(response.body));
      return getLeaveStatusModel;
    }
    return null;
  }
  /// Get Today Attendance List Api Calling .....
  static Future<TodayAttendanceModel?> getTodayAttendanceList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    TodayAttendanceModel? todayAttendanceModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetCurrentDayAttendance,
      checkResponse: checkResponse,
    );
    if (response != null) {
      todayAttendanceModel = TodayAttendanceModel.fromJson(jsonDecode(response.body));
      return todayAttendanceModel;
    }
    return null;
  }

  /// Get All Attendance List Api Calling .....
  static Future<GetAllAttendanceModel?> getAllAttendanceList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetAllAttendanceModel? getAllAttendanceModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetAllAttendance,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getAllAttendanceModel = GetAllAttendanceModel.fromJson(jsonDecode(response.body));
      return getAllAttendanceModel;
    }
    return null;
  }

  /// Get  Attendance Details By Dates Api Calling .....
  static Future<GetDateWiseDataModel?> getDateWiseDataApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetDateWiseDataModel? getDateWiseDataModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetDateWiseData,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getDateWiseDataModel = GetDateWiseDataModel.fromJson(jsonDecode(response.body));
      return getDateWiseDataModel;
    }
    return null;
  }


  /// Get Privacy policy Api Calling .....
  static Future<GetPrivacyPolicyModel?> getPrivacyPolicy({
    void Function(int)? checkResponse,
  }) async {
    GetPrivacyPolicyModel? getPrivacyPolicyModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPrivacyPolicy,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPrivacyPolicyModel = GetPrivacyPolicyModel.fromJson(jsonDecode(response.body));
      return getPrivacyPolicyModel;
    }
    return null;
  }

  /// Get Terms Condition Api Calling .....
  static Future<GetTermConditionModel?> getTermCondition({
    void Function(int)? checkResponse,
  }) async {
    GetTermConditionModel? termConditionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetTermCondition,
      checkResponse: checkResponse,
    );
    if (response != null) {
      termConditionModel = GetTermConditionModel.fromJson(jsonDecode(response.body));
      return termConditionModel;
    }
    return null;
  }

  /// Change Password  Api Calling .....
  static Future<ChangePasswordModel?> changePasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ChangePasswordModel? changePasswordModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      changePasswordModel = ChangePasswordModel.fromJson(jsonDecode(response.body));
      return changePasswordModel;
    }
    return null;
  }

  /// Edit Profile  Api Calling .....
  static Future<EditProfileModel?> editProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    File? image
  }) async {
    EditProfileModel? editProfileModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfEditProfile,
      image: image,
      imageKey: 'image'
      //checkResponse: checkResponse,
    );
    if (response != null) {
      editProfileModel = EditProfileModel.fromJson(jsonDecode(response.body));
      return editProfileModel;
    }
    return null;
  }

  /// GetNotification   Api Calling .....
  static Future<GetNotificationModel?> getNotificationApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetNotificationModel? getNotificationModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getNotificationModel = GetNotificationModel.fromJson(jsonDecode(response.body));
      return getNotificationModel;
    }
    return null;
  }



}