
import 'package:cleancrewdriver/Auth/getstarted.dart';
import 'package:cleancrewdriver/Auth/signup.dart';
import 'package:cleancrewdriver/modes/cleanerMode/cleanerhome/navbar.dart';
import 'package:cleancrewdriver/modes/driverMode/driverhomescreen.dart';
import 'package:cleancrewdriver/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool a = false;
  bool x = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 20.sp,
          icon: Icon(
            Icons.arrow_back,
          ), // Back button icon
          onPressed: () {
            // Action when the back button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Getstarted()),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  SizedBox(
                    height: 65.h,
                    width: 284.w,
                    child: Column(
                      children: [
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 26.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Log In to access your account",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromRGBO(158, 158, 158, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0.sp,
                      right: 15.0.sp,
                    ),
                    child: MyTextField(
                      hintText: "Enter your email",
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.mail_outline,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0.sp,
                      right: 15.0.sp,
                      top: 5.0.sp,
                    ),
                    child: MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.password),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                              value: a,
                              onChanged: (x) {
                                setState(
                                  () {
                                    if (x == true) {
                                      a = true;
                                    }
                                    if (x == false) {
                                      a = false;
                                    }
                                  },
                                );
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Color.fromRGBO(37, 37, 37, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromRGBO(255, 57, 81, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 15.sp,
                          right: 15.sp,
                        ),
                        height: 55.h,
                        width: 353.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomBottomNavBar()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Background color
                      
                            elevation: 0, // Elevation
                      
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                          ),
                          child: Text(
                            "Log In as Cleaner",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        padding: EdgeInsets.only(
                          left: 15.sp,
                          right: 15.sp,
                        ),
                        height: 55.h,
                        width: 353.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverHomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Background color
                      
                            elevation: 0, // Elevation
                      
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                          ),
                          child: Text(
                            "Log In as Driver",
                            style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
