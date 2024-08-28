// import 'dart:async';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class DeviceDetails extends StatefulWidget {
//   const DeviceDetails({super.key});
//
//   @override
//   State<DeviceDetails> createState() => _DeviceDetailsState();
// }
//
// class _DeviceDetailsState extends State<DeviceDetails> {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, String> _deviceData = <String, String>{};
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   Future<void> initPlatformState() async {
//     Map<String, String> deviceData = <String, String>{};
//
//     try {
//       if (kIsWeb) {
//         deviceData = _extractDeviceInfo(await deviceInfoPlugin.webBrowserInfo);
//       } else {
//         switch (defaultTargetPlatform) {
//           case TargetPlatform.android:
//             deviceData = _extractDeviceInfo(await deviceInfoPlugin.androidInfo);
//             break;
//           case TargetPlatform.iOS:
//             deviceData = _extractDeviceInfo(await deviceInfoPlugin.iosInfo);
//             break;
//           default:
//             deviceData = <String, String>{
//               'Error': 'Unsupported platform',
//             };
//         }
//       }
//     } on PlatformException {
//       deviceData = <String, String>{'Error': 'Failed to get platform version.'};
//     }
//
//     if (!mounted) return;
//
//     setState(() {
//       _deviceData = deviceData;
//     });
//   }
//
//   Map<String, String> _extractDeviceInfo(dynamic deviceInfo) {
//     if (deviceInfo is AndroidDeviceInfo) {
//       return {
//         'Model': deviceInfo.model,
//         'Manufacturer': deviceInfo.manufacturer,
//         'Brand': deviceInfo.brand,
//         'SDK': deviceInfo.version.sdkInt.toString(),
//         'Release': deviceInfo.version.release,5
//       };
//     } else if (deviceInfo is IosDeviceInfo) {
//       return {
//         'Model': deviceInfo.model,
//         'Manufacturer': 'Apple',
//         'Brand': 'Apple',
//         'SDK': deviceInfo.systemVersion,
//         'Release': deviceInfo.systemVersion,
//       };
//     }
//     return <String, String>{};
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: const Color(0xFF4376F8),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(_getAppBarTitle()),
//           elevation: 4,
//         ),
//         body: ListView(
//           children: _deviceData.keys.map(
//                 (String property) {
//               return Row(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(
//                       property,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         '${_deviceData[property]}',
//                         maxLines: 10,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
//
//   String _getAppBarTitle() {
//     if (kIsWeb) {
//       return 'Web Browser Info';
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return 'Android Device Info';
//       case TargetPlatform.iOS:
//         return 'iOS Device Info';
//       default:
//         return 'Device Info';
//     }
//   }
// }
