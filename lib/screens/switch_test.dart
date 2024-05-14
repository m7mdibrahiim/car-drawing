// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class ToggleButton extends StatefulWidget {
//   final databaseReference = FirebaseDatabase.instance.reference();

//   void _updateCarState(String direction) {
//     databaseReference.child('car').set(direction);
//   }

//   void _moveServo(int degrees) {
//     databaseReference.child('car').set(degrees);
//   }

//   @override
//   _ToggleButtonState createState() => _ToggleButtonState();
// }

// class _ToggleButtonState extends State<ToggleButton> {
//   final databaseReference = FirebaseDatabase.instance.reference();

//   void _moveServo(int degrees) {
//     databaseReference.child('car').set(degrees);
//   }

//   bool _isOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Switch(
//           value: _isOn,
//           onChanged: (newValue) {
//             setState(() {
//               _isOn = newValue;
//             });
//             if (_isOn == true) {
//               _moveServo(180);
//             } else {
//               _moveServo(0);
//             }
//           },
//           activeColor: Colors.purple, // لون الزر عند التشغيل
//           inactiveThumbColor: Colors.grey, // لون الزر عند الإيقاف
//           inactiveTrackColor: Colors.grey[300], // لون المسار عند الإيقاف
//         ),
//         Text(_isOn ? 'ON' : 'OFF'),
//       ],
//     );
//   }
// }



//--------------------------------------------------------//


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kdgaugeview/kdgaugeview.dart';

// class SpeedometerScreen extends StatefulWidget {
//   @override
//   _SpeedometerScreenState createState() => _SpeedometerScreenState();
// }

// class _SpeedometerScreenState extends State<SpeedometerScreen> {
//   double _currentSpeed = 100.0;

//   void _updateSpeed(double newSpeed) {
//     setState(() {
//       _currentSpeed = newSpeed;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Car Speedometer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 250,
//               width: 250,
//               child: KdGaugeView(
//                 minSpeed: 0,
//                 maxSpeed: 200,
//                 speed: _currentSpeed,
//                 unitOfMeasurement: 'Mbps',
//                 speedTextStyle: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//                 duration: Duration(milliseconds: 1000),
//                 animate: true,
//                 alertSpeedArray: [40, 80, 90],
//                 alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
//                 gaugeWidth: 10,
//                 fractionDigits: 1,
//               ),
//             ),
//             SizedBox(height: 1),
//             Slider(
//               value: _currentSpeed,
//               min: 0,
//               max: 200,
//               onChanged: _updateSpeed,
//               activeColor: Colors.blue,
//               inactiveColor: Colors.grey.withOpacity(0.5),
//               divisions: 20,
//               label: '$_currentSpeed Mbps',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
