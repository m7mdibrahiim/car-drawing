// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// class Bluetooth_Page extends StatefulWidget {
//   const Bluetooth_Page({super.key});
//   static String id = 'Bluetooth_Page';

//   @override
//   State<Bluetooth_Page> createState() => _Bluetooth_PageState();
// }

// class _Bluetooth_PageState extends State<Bluetooth_Page> {
//   final FlutterBluePlus flutterBlue = FlutterBluePlus();

//   List<BluetoothDevice> devicesList = [];

//   void initState() {
//     super.initState();
//     _startScan();
//   }

//   void _startScan() async {
//     FlutterBluePlus.startScan(timeout: Duration(seconds: 4), withServices: []);
//     FlutterBluePlus.scanResults.listen((/*List<ScanResult>*/ results) {
//       print(results);
//       print(devicesList);
//       for (ScanResult r in results) {
//         print('Device found : ${r.device.name}');
//       }
//       setState(() {
//         devicesList = List.from(results);
//       });
//     }
//         // var subscription =
//         //     FlutterBluePlus.scanResults.listen((/*List<ScanResult>*/ results) {
//         //   for (ScanResult r in results) {
//         //     setState(() {
//         //       devicesList.add(r);
//         //     });
//         //   }
//         // },
//         );
//     await Future.delayed(Duration(seconds: 4));
//     await FlutterBluePlus.stopScan();

//     // subscription.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Devices'),
//       ),
//       body: ListView.builder(
//           itemCount: devicesList.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(devicesList[index].platformName),
//               subtitle: Text(devicesList[index].remoteId.toString()),
//             );
//           }),
//     );
//   }
// }
