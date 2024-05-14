import 'package:arduino_app/database/model/my_database.dart';
import 'package:arduino_app/database/model/user.dart';
import 'package:arduino_app/helper/dialog_utils.dart';
import 'package:arduino_app/helper/validation_page.dart';
import 'package:arduino_app/screens/arduino_page.dart';
import 'package:arduino_app/screens/custom_form_field.dart';
import 'package:arduino_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordconfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/images/backgr.png'),
                  fit: BoxFit.cover),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              IconButton(
                onPressed: (Navigator.of(context).pop),
                icon: Icon(Icons.arrow_back),
                alignment: Alignment.topLeft,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 28),
                child: Center(
                  child: Text(
                    'Hello! Register to get started',
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: Color.fromARGB(255, 223, 213, 248),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomFormField(
                  controller: nameController,
                  validator: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  hintname: 'Name',
                  labelname: 'full name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomFormField(
                  controller: emailController,
                  validator: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return 'Please enter your Email';
                    }

                    if (!ValidationUtils.isValidEmail(data)) {
                      return 'please enter a valid email';
                    }
                  },
                  hintname: 'Email ',
                  labelname: 'e-mail address',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomFormField(
                  controller: passwordController,
                  validator: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (data.length < 6) {
                      return 'your password is weakness';
                    }
                  },
                  hintname: 'Password',
                  labelname: 'Password',
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomFormField(
                  controller: passwordconfirmationController,
                  validator: (data) {
                    if (data == null || data.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (data.length < 6) {
                      return 'your password is weakness';
                    }
                    if (passwordController.text != data) {
                      return "your password dosn't match";
                    }
                  },
                  hintname: 'Password Confirmation',
                  labelname: 'Confirm password',
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(20.sp, 55.sp)),
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    register();
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18.sp,
                        backgroundColor: Colors.black,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?  ',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login_page();
                          },
                        ),
                      );
                    },
                    child: Text(
                      ' Login Now',
                      style: TextStyle(
                          color: Color.fromARGB(255, 178, 255, 182),
                          fontSize: 16.sp),
                    ),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  FirebaseAuth authService = FirebaseAuth.instance;

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      var result = await authService.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      dialogUtils.showLoadingDialog(context, 'Loading...');
      var myUser = Userr(
          id: result.user?.uid,
          name: nameController.text,
          email: emailController.text);

      await MyDataBase.addUser(myUser);
      dialogUtils.hideLoadingDialog(context);

      dialogUtils.showSnackBar(
        context,
        'successful registration',
        'ok',
        () {
          Navigator.pushNamed(context, Arduino_Page.id);
        },
      );
      Navigator.pushNamed(context, Arduino_Page.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        dialogUtils.showSnackBar(
          context,
          'The password provided is too weak.',
          'ok',
          () {},
        );

        dialogUtils.hideLoadingDialog(context);
      } else if (e.code == 'email-already-in-use') {
        dialogUtils.showSnackBar(
          context,
          'this account already registered.',
          'ok',
          () {},
        );

        dialogUtils.hideLoadingDialog(context);
      }
    } catch (e) {
      dialogUtils.hideLoadingDialog(context);

      print(e);
    }
  }
}
