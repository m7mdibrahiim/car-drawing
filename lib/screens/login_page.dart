import 'package:arduino_app/database/model/my_database.dart';
import 'package:arduino_app/helper/validation_page.dart';
import 'package:arduino_app/screens/arduino_page.dart';
import 'package:arduino_app/screens/custom_form_field.dart';
import 'package:arduino_app/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arduino_app/helper/dialog_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login_page extends StatefulWidget {
  Login_page({super.key});
  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/images/backgr.png'),
                    fit: BoxFit.cover),
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 32),
                  child: IconButton(
                    onPressed: (Navigator.of(context).pop),
                    icon: Icon(Icons.arrow_back),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Welcome back! Glad to see you, Again!',
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomFormField(
                      hintname: 'e-mail',
                      labelname: 'e-mail',
                      validator: (data) {
                        if (data == null || data.trim().isEmpty) {
                          return 'Please enter your Email';
                        }

                        if (!ValidationUtils.isValidEmail(data)) {
                          return 'please enter a valid email';
                        }
                      },
                      controller: emailController),
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
                    hintname: 'password',
                    labelname: 'password',
                    isPassword: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        // onFocusChange: (value) => Arduino_Page.id,
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(350.sp, 55.sp)),
                            minimumSize:
                                MaterialStateProperty.all(Size(20.sp, 55.sp)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18.sp,
                              backgroundColor: Colors.black,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Row(
                    children: [
                      Text(
                        'create new account?',
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          '  register',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Color.fromARGB(255, 134, 240, 139)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FirebaseAuth authService = FirebaseAuth.instance;

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    dialogUtils.showLoadingDialog(context, 'Loading...');

    try {
      var result = await authService.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var user = await MyDataBase.readUser(result.user?.uid ?? "");
      dialogUtils.hideLoadingDialog(context);
      if (user == null) {
        dialogUtils.showSnackBar(
          context,
          "error. can't find user in database",
          'ok',
          () {},
        );
        return;
      }
      Navigator.pushNamed(context, Arduino_Page.id);
      dialogUtils.showSnackBar(
        context,
        'Successful Login',
        'ok',
        () {
          // Navigator.pushNamed(context, Arduino_Page.id);
        },
      );
    } on FirebaseAuthException catch (e) {
      dialogUtils.showSnackBar(
        context,
        'wrong email or password .',
        'ok',
        () {},
      );

      dialogUtils.hideLoadingDialog(context);
    } catch (e) {
      dialogUtils.hideLoadingDialog(context);

      print(e);
    }
  }
}
