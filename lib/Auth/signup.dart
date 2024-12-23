

import 'package:cleancrewdriver/Auth/getstarted.dart';
import 'package:cleancrewdriver/Auth/login.dart';
import 'package:cleancrewdriver/Auth/profilesetup.dart';
import 'package:cleancrewdriver/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              'Log In',
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
                    height: 60.h,
                  ),
                  SizedBox(
                    height: 65.h,
                    width: 284.w,
                    child: Column(
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 26.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          "By creating a free account.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(158, 158, 158, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0.sp,
                      right: 15.0.sp,
                    ),
                    child: MyTextField(
                      hintText: "Enter full name",
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0.sp, right: 15.0.sp, ),
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
                        left: 15.0.sp, right: 15.0.sp,),
                    child: MyTextField(
                      hintText: "Enter phone number",
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.phone_iphone_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0.sp, right: 15.0.sp,),
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0.sp, right: 15.0.sp,),
                    child: MyTextField(
                      hintText: "Confirm password",
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
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 11.sp, left: 11.sp),
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
                          'By checking the box you agree to our',
                          style: TextStyle(
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                                fontSize: 8.sp,
                                color: Color.fromRGBO(255, 57, 81, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.sp, right: 15.sp,),
                    height: 55.h,
                    width: 353.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyProfileSetup()),
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
                        "Sign Up",
                        style: TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    
                  ),
                  SizedBox(height: 10.sp,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
