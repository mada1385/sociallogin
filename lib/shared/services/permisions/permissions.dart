// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../../utils/uiutils.dart';

// class Permessions {
//   //get cam per shows dialog if rejected!!
//   static Future<bool> getCamPerm(BuildContext context) async {
//     final permession = await Permission.camera.request();

//     if (!permession.isGranted) {
//       final action = await UI.dialog(
//             context: context,
//             accept: true,
//             title: "permission denied",
//             msg: "camera denied",
//             cancelMsg: 'cancel',
//             acceptMsg: 'try again',
//           ) ??
//           false;

//       if (action) return await getCamPerm(context) ?? false;
//     }
//     return permession.isGranted;
//   }

//   static Future<bool> getStoragePerm(BuildContext context) async {
//     final granted1 = (await Permission.storage.request()).isGranted;
//     bool granted2;

//     if (Platform.isIOS) {
//       granted2 = (await Permission.mediaLibrary.request()).isGranted;
//     } else {
//       granted2 = granted1;
//     }

//     if (!granted1 || !granted2) {
//       final action = await UI.dialog(
//             context: context,
//             title: "permission denied",
//             accept: true,
//             cancelMsg: 'cancel',
//             acceptMsg: 'try again',
//           ) ??
//           false;

//       if (action) return await getStoragePerm(context) ?? false;
//     }
//     return granted1 && granted2;
//   }

//   static Future<bool> getLocationPerm(BuildContext context) async {
//     final permession = await Permission.location.request();

//     if (!permession.isGranted) {
//       final action = await UI.dialog(
//             context: context,
//             accept: true,
//             title: "permission denied",
//             msg: "permission denied",
//             cancelMsg: 'cancel',
//             acceptMsg: 'try again',
//           ) ??
//           false;

//       if (action) return await getLocationPerm(context) ?? false;
//     }
//     return permession.isGranted;
//   }

//   static Future<bool> getAudioPermession(BuildContext context) async {
//     try {
//       final permession = await Permission.microphone.request();
//       final permession2 = await Permission.storage.request();

//       if (!permession.isGranted || !permession2.isGranted) {
//         final action = await UI.dialog(
//               context: context,
//               accept: true,
//               title: "permission denied",
//               msg: "permission denied",
//               cancelMsg: 'cancel',
//               acceptMsg: 'try again',
//             ) ??
//             false;

//         if (action) return await getAudioPermession(context) ?? false;
//       }
//       return permession.isGranted;
//     } catch (e) {
//       return false;
//     }
//   }
// }
