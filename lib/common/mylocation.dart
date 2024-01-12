/*
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
*/

/*
       in case of Permission Denied   Forever
	     <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
*/

//** add this line PROJECT LEVEL BUILD GRADLE allprojects


/*          configurations.all {
          resolutionStrategy {
                force "com.google.android.gms:play-services-location:21.0.1"
                             }
                                }
*/

import 'package:attendance_app/common/ShowToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:open_apps_settings/open_apps_settings.dart';
import 'package:open_apps_settings/settings_enum.dart';


class MyLocation {
  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
  static Future<Map<String, dynamic>?> getCurrentLocation(
      {required BuildContext context}) async {
    if (await internetConnectionCheckerMethod()) {
      Location location = Location();
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      serviceEnabled = await location.serviceEnabled();

      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return null;
        }
      }

      permissionGranted = await location.hasPermission();

      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted == PermissionStatus.denied) {
          return null;
        } else if (permissionGranted == PermissionStatus.deniedForever) {
          await OpenAppsSettings.openAppsSettings(
              settingsCode: SettingsCode.APP_SETTINGS);
          permissionGranted = await location.hasPermission();
          if (permissionGranted == PermissionStatus.denied) {
            return null;
          } else if (permissionGranted == PermissionStatus.deniedForever) {
            return null;
          } else if (permissionGranted == PermissionStatus.granted) {
            return await getUserLocationCredential(location: location);
          }
        } else if (permissionGranted == PermissionStatus.granted) {
          return await getUserLocationCredential(location: location);
        }
      } else if (permissionGranted == PermissionStatus.granted) {
        return await getUserLocationCredential(location: location);
      }
    } else {
      showToastMessage('Please check your internet connection');
      return null;
    }

    return null;
  }


  static Future<Map<String, dynamic>?> getUserLocationCredential(
      {required Location location}) async {
    LocationData? myLocation;
    Map<String, dynamic> addressDataMap = {};
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {}
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {}

      return null;
    }

    if (myLocation.latitude != null && myLocation.longitude != null) {
      final coordinates = Coordinates(myLocation.latitude, myLocation.longitude);
      final LocatitonGeocoder geocoder = LocatitonGeocoder('hjjaahliauiadfhjadjkjkadkjhuioaoiuasdjjewwhkiuoasfjdafsljh');
      List<Address> addresses = await geocoder.findAddressesFromCoordinates(coordinates);
      if (addresses.isNotEmpty) {
        Address addressData = addresses.first;
        addressDataMap = {
          MyAddressKeyConstant.countryCode: addressData.countryCode ?? "",
          /*IN*/
          MyAddressKeyConstant.countryName: addressData.countryName ?? "",
          MyAddressKeyConstant.state: addressData.adminArea ?? "",
          MyAddressKeyConstant.subState: addressData.subAdminArea ?? "",
          MyAddressKeyConstant.addressDetail: addressData.addressLine ?? "",
          MyAddressKeyConstant.subAddressDetail: addressData.featureName ?? "",
          MyAddressKeyConstant.city: addressData.locality ?? "",
          MyAddressKeyConstant.area: addressData.subLocality ?? "",
          MyAddressKeyConstant.pinCode: addressData.postalCode ?? "",
          MyAddressKeyConstant.subArea: addressData.thoroughfare ?? "",
          MyAddressKeyConstant.latitude: myLocation.latitude ?? "",
          MyAddressKeyConstant.longitude: myLocation.longitude ?? "",
          MyAddressKeyConstant.myLocation: myLocation ?? "",
          MyAddressKeyConstant.location: location ?? "",
        };
        return addressDataMap;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<GetLatLong ?> getUserLatLong(
      {required BuildContext context}) async {
    if (await internetConnectionCheckerMethod()) {
      Location location = Location();
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return null;
        }
      }
      permissionGranted = await location.hasPermission();
      print("jajajajaja::::::::::1${permissionGranted}");

      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        print("jajajajaja::::::::::2${permissionGranted}");
        if (permissionGranted == PermissionStatus.denied) {
          return null;
        } else if (permissionGranted == PermissionStatus.deniedForever) {
          await OpenAppsSettings.openAppsSettings(
              settingsCode: SettingsCode.APP_SETTINGS);
          permissionGranted = await location.hasPermission();
          if (permissionGranted == PermissionStatus.denied) {
            return null;
          } else if (permissionGranted == PermissionStatus.deniedForever) {
            return null;
          } else if (permissionGranted == PermissionStatus.granted) {
            return await getLatLong(location: location);
          }
        } else if (permissionGranted == PermissionStatus.granted) {
          return await getLatLong(location: location);
        }
      } else if (permissionGranted == PermissionStatus.granted) {
        return await getLatLong(location: location);
      }
    } else {
      showToastMessage('Please check your internet connection');
      return null;
    }
    return null;
  }


  static Future<GetLatLong?> getLatLong(
      {required Location location}) async {
    LocationData? myLocation;
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {}
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {}

      return null;
    }

    if (myLocation.latitude != null && myLocation.longitude != null) {

      GetLatLong getLatLongData=GetLatLong(latitude:myLocation.latitude,longitude: myLocation.longitude );


      return getLatLongData;
    } else {
      return null;
    }
  }

}

class MyAddressKeyConstant {
  static String countryCode = "countryCode";
  static String countryName = "countryName";
  static String state = "state";
  static String subState = "subState";
  static String addressDetail = "addressDetail";
  static String subAddressDetail = "subAddressDetail";
  static String city = "city";
  static String area = "area";
  static String pinCode = "pinCode";
  static String subArea = "subArea";
  static String latitude = "latitude";
  static String longitude = "longitude";
  static String myLocation = "myLocation";
  static String location = "location";
}

class GetLatLong{
  double? latitude;
  double? longitude;

  GetLatLong({ double? latitude, double? longitude})
  {
    this.latitude=latitude;
    this.longitude=longitude;
  }


}
