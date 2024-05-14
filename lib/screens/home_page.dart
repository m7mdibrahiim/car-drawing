import 'package:arduino_app/screens/arduino_page.dart';
import 'package:arduino_app/screens/control_page.dart';
import 'package:arduino_app/screens/custom_form_field.dart';
import 'package:arduino_app/screens/login_page.dart';
import 'package:arduino_app/screens/register_page.dart';
import 'package:arduino_app/screens/switch_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 102, 41, 186),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/backgr.png'),
                fit: BoxFit.cover),
          ),
        ),
        ListView(children: [
          // Container(
          //   child: Image.asset('assets/images/welcome page.png'),
          //   height: 350.h,
          //   width: 400.w,
          // ),
          SizedBox(
            height: 270.h,
          ),
          Center(
            child: Text(
              'Explore the app',
              style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 246, 244, 244)),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(350.sp, 55.sp)),
                  minimumSize: MaterialStateProperty.all(Size(20.sp, 55.sp)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login_page();
                }));
              },
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 18.sp,
                    backgroundColor: Colors.black,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(350.sp, 55.sp)),
                  minimumSize: MaterialStateProperty.all(Size(20.sp, 55.sp)),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              },
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 18.sp,
                    backgroundColor: Colors.white,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 190.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Control_Page.id);
              },
              child: Text(
                'Continue as a guest',
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Color.fromARGB(249, 244, 246, 246),
                    backgroundColor: Color.fromARGB(255, 71, 52, 124)),
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
