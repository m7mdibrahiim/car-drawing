import 'package:arduino_app/screens/connection_page.dart';
import 'package:arduino_app/screens/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Arduino_Page extends StatelessWidget {
  const Arduino_Page({super.key});
  static String id = 'Arduino_Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Color.fromARGB(255, 206, 91, 229),
              iconSize: 45.sp,
            ),
            SizedBox(
              width: 70.sp,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Team_Page.id);
              },
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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   // iconTheme: IconThemeData(color: Colors.black, size: 26.sp),
      //   elevation: 0,
      //   title: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SizedBox(
      //         width: 10.w,
      //       ),
      //       Text(
      //         'Home',
      //         style: TextStyle(color: Colors.black, fontSize: 18),
      //       ),
      //       SizedBox(
      //         width: 25.w,
      //       ),
      //       Text(
      //         'Devices',
      //         style: TextStyle(color: Colors.black, fontSize: 18),
      //       ),
      //       SizedBox(
      //         width: 25.w,
      //       ),
      //       Text(
      //         'About Us',
      //         style: TextStyle(color: Colors.black, fontSize: 18),
      //       ),
      //       SizedBox(
      //         width: 25.w,
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.pushNamed(context, Team_Page.id);
      //         },
      //         child: Text(
      //           'Control',
      //           style: TextStyle(
      //               color: Color.fromARGB(248, 20, 122, 114),
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               backgroundColor: Colors.green.shade50,
      //               // decoration: TextDecoration.underline,
      //               decorationColor: Colors.grey,
      //               decorationThickness: 2),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/images/backgr.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  'Optimize performance, Maintain Control: Monitor Hardware Car Brushes on the Ground with Precision',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Container(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  height: 200.h,
                  width: 200.w,
                  child: Image.asset(
                    'assets/images/car3.png',
                    height: double.infinity,
                  ),
                ),
                Text(
                  'Devices',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30.h,
                ),
                //1
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffB8CACB),
                        image: DecorationImage(
                          image: AssetImage('assets/images/esp.png'),
                        ),
                      ),
                      height: 140.h,
                      width: 147.w,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 200.w,
                      child: Text(
                        'The ESP32-DevKitC is a powerful development board based on the ESP32 microcontroller.',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 206, 212, 215),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                //2
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffB8CACB),
                        image: DecorationImage(
                          image: AssetImage('assets/images/motor.png'),
                        ),
                      ),
                      height: 140.h,
                      width: 147.w,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 200.w,
                      child: Text(
                        'The 24V DC 200 RPM gear motor converts electrical energy into mechanical motion at 200 RPM efficiently.',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 206, 212, 215),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                //3
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffB8CACB),
                        image: DecorationImage(
                          image: AssetImage('assets/images/batteryy.png'),
                        ),
                      ),
                      height: 140.h,
                      width: 147.w,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 200.w,
                      child: Text(
                        'The image shows a 12V, 5400mAh rechargeable Lithium-ion battery pack labeled as "Li-ion BATTERY."',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 206, 212, 215),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                //4
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffB8CACB),
                        image: DecorationImage(
                          image: AssetImage('assets/images/tire.png'),
                        ),
                      ),
                      height: 140.h,
                      width: 147.w,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 132.h,
                      width: 200.w,
                      child: Text(
                        "The tire's robust tread design and sturdy build make it ideal for robotic applications that demand traction and stability.",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 206, 212, 215),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                //5
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffB8CACB),
                        image: DecorationImage(
                          image: AssetImage('assets/images/dc.png'),
                        ),
                      ),
                      height: 140.h,
                      width: 147.w,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 200.w,
                      child: Text(
                        'The H-bridge motor driver module efficiently controls the speed and direction of two DC motors in robotics and electronics projects.',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 206, 212, 215),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/us.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Meet the team behind the project',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'We are a group of passionate professionals who are dedicated to bringing you the best quality product. Our team is composed of talented individuals with diverse backgrounds.',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 198, 187, 187)),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/contact.png')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
