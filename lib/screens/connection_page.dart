import 'package:arduino_app/helper/bluetooth_page.dart';
import 'package:arduino_app/screens/servo_page.dart';
import 'package:arduino_app/screens/control_page.dart';
import 'package:arduino_app/screens/switch_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arduino_app/helper/bluetooth_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arduino_app/helper/dialog_utils.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});
  static String id = 'ConnectionPage';

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Logo.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 38, 0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.keyboard_double_arrow_left),
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _pageController.animateToPage(_currentPage + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        icon: Icon(Icons.keyboard_double_arrow_right),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/turn on g.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(_currentPage - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  icon: Icon(Icons.keyboard_double_arrow_left_sharp),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                ),
                SizedBox(
                  height: 730.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(_currentPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size(260.sp, 49.sp)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 165, 76, 225))),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/wifi.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(_currentPage - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  icon: Icon(Icons.keyboard_double_arrow_left_sharp),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                ),
                SizedBox(
                  height: 730.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      dialogUtils.showSnackBar(
                          context, 'You Must Turn On Wi-Fi', 'Ok', () {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Control_Page();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 22.sp, color: Colors.white),
                    ),
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size(260.sp, 49.sp)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 165, 76, 225))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
