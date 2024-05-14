import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MyValidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  CustomFormField({
    super.key,
    required this.hintname,
    required this.labelname,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.controller,
  });
  String hintname;
  String labelname;
  bool isPassword;
  TextInputType keyboardType;
  MyValidator validator;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: hintname,
          hintStyle: TextStyle(color: Color.fromARGB(255, 181, 173, 173)),
          labelText: labelname,
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
