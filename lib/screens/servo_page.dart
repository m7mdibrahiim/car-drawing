import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Servo_Button_Switch extends StatefulWidget {
  @override
  _Servo_Button_SwitchState createState() => _Servo_Button_SwitchState();
}

class _Servo_Button_SwitchState extends State<Servo_Button_Switch> {
  final databaseReference = FirebaseDatabase.instance.reference();
  void _moveServo(int degrees) {
    databaseReference.child('car').set({'servo': degrees});
  }

  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
        });
        if (_isOn == true) {
          _moveServo(180);
        } else {
          _moveServo(0);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            _isOn ? 'assets/images/button.png' : 'assets/images/buttonOff.png',
            fit: BoxFit.cover,
          ),
          Text(
            _isOn ? 'ON' : 'OFF',
            style: TextStyle(
              color: Color.fromARGB(255, 186, 188, 189),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
