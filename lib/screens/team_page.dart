import 'package:arduino_app/screens/arduino_page.dart';
import 'package:arduino_app/screens/connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Team_Page extends StatelessWidget {
  const Team_Page({super.key});
  static String id = 'Team_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Arduino_Page.id);
              },
              icon: Icon(Icons.home),
              iconSize: 45.sp,
            ),
            SizedBox(
              width: 70.sp,
            ),
            IconButton(
              color: Color.fromARGB(255, 206, 91, 229),
              onPressed: () {},
              icon: Icon(Icons.people_outline),
              iconSize: 45.sp,
            ),
            SizedBox(
              width: 70.sp,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ConnectionPage.id);
              },
              icon: Icon(Icons.control_camera_sharp),
              iconSize: 45.sp,
            ),
          ],
        ),
        height: 75.h,
        color: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 19),
      ),
      backgroundColor: Colors.deepPurple,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(8, 28, 38, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.keyboard_double_arrow_left),
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/images/team.png'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
