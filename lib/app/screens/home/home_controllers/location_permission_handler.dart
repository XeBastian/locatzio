// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart' as permision;
// import 'package:app_settings/app_settings.dart';

// class PermissionHandler {
//   static askLocationPermission() async {
//     permision.PermissionStatus locationPermissionStatus = await permision.Permission.location.request();
//     Location location = Location();
//     bool ison = await location.serviceEnabled();
//     if (locationPermissionStatus.isDenied) {
//       permision.Permission.location.request();
//     }
//     if (locationPermissionStatus.isPermanentlyDenied) {
//       permision.openAppSettings();
//     }
//     if (!ison) {
//       bool isturnedon = await location.requestService();
//       if (isturnedon) {
//         //  OKAY CONTINUE
//         if (locationPermissionStatus.isDenied) {
//           permision.Permission.location.request();
//         }
//         if (locationPermissionStatus.isPermanentlyDenied) {
//           permision.openAppSettings();
//         }
//       } else {
//         debugPrint('Something bad just happened');
//         AppSettings.openAppSettings(
//           type: AppSettingsType.location,
//         );
//       }
//     }
//   }
// }
