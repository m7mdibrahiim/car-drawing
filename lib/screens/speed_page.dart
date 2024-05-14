import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class SpeedMotor extends StatelessWidget {
  const SpeedMotor({super.key});

  @override
  Widget build(BuildContext context) {
    double _currentSpeed = 100.0;

    return Container(
      height: 160,
      width: 160,
      child: KdGaugeView(
        minSpeed: 0,
        maxSpeed: 200,
        speed: _currentSpeed,
        unitOfMeasurement: 'Mbps',
        minMaxTextStyle: TextStyle(fontSize: 12),
        unitOfMeasurementTextStyle:
            const TextStyle(fontSize: 12, color: Colors.grey),
        speedTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        duration: Duration(milliseconds: 1000),
        animate: true,
        alertSpeedArray: [40, 80, 90],
        alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
        gaugeWidth: 10,
        fractionDigits: 1,
      ),
    );
  }
}
