import 'dart:ffi';

import 'package:arduino_app/screens/arduino_page.dart';
import 'package:flutter/material.dart';

class dialogUtils {
  // String? labelAction;
  // Function? onPressed;
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showSnackBar(BuildContext context, String message,
      String labelAction, VoidCallback? onPressed) {
    // VoidCallback? onPressed;
    // if (onPressed == null) {
    //   dialogUtils.showSnackBar(context, 'message', 'labelAction', () {});
    //}
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(left: 55),
        duration: Duration(seconds: 6),
        backgroundColor: Color.fromARGB(255, 167, 91, 155),
        content: Text(
          message,
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 12, 12, 12),
              fontWeight: FontWeight.bold),
        ),
        action: SnackBarAction(
          label: labelAction,
          onPressed: onPressed!,

          // () {
          //   Navigator.pushNamed(context, Arduino_Page.id);
          // },
        ),
      ),
    );
  }
}
