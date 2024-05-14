import 'package:arduino_app/firebase_options.dart';
import 'package:arduino_app/helper/bluetooth_page.dart';
import 'package:arduino_app/screens/arduino_page.dart';
import 'package:arduino_app/screens/connection_page.dart';
import 'package:arduino_app/screens/control_page.dart';
import 'package:arduino_app/screens/home_page.dart';
import 'package:arduino_app/screens/switch_test.dart';
import 'package:arduino_app/screens/team_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ArduinoApp());
}

class ArduinoApp extends StatelessWidget {
  const ArduinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        routes: {
          Arduino_Page.id: (context) => Arduino_Page(),
          HomePage.id: (context) => HomePage(),
          ConnectionPage.id: (context) => ConnectionPage(),
          //Bluetooth_Page.id: (context) => Bluetooth_Page(),
          Team_Page.id: (context) => Team_Page(),
          Control_Page.id: (context) => Control_Page(),
          //  MyButtonPage.id: (context) => MyButtonPage()
        },
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
        //Arduino_Page.id,
      ),
    );
  }
}
