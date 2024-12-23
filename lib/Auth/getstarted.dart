
import 'package:cleancrewdriver/Auth/login.dart';
import 'package:cleancrewdriver/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 279.w,
                  height: 157.h,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/image1.png",
                        height: 86.15.h,
                        width: 116.w,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 279.w,
                        height: 40.h,
                        child: Text(
                          "Join us and experience top-tier cleaning services tailored to your needs.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 14.sp,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  height: 55.h,
                  width: 353.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
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
                      "Log In",
                      style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  height: 55.h,
                  width: 353.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(213, 76, 68, 1), // Background color
                      foregroundColor: Colors.white, // Text color
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.7.h,
                      width: 120.w,
                      color: Color.fromRGBO(158, 158, 158, 0.9),
                    ),
                    Text(
                      " Or continue with ",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(158, 158, 158, 0.9),
                      ),
                    ),
                    Container(
                      height: 0.7.h,
                      width: 120.w,
                      color: Color.fromRGBO(158, 158, 158, 0.9),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 60.h,
                  width: 353.w,
                  padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius:
                              BorderRadius.circular(6.sp), // Rounded corners
                        ),
                        height: 55.h,
                        width: 145.w,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/google.png'),
                              SizedBox(width: 10.h),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius:
                              BorderRadius.circular(6.sp), // Rounded corners
                        ),
                        height: 55.h,
                        width: 145.h,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/apple.png'),
                              SizedBox(width: 10.w),
                              Text(
                                "Apple",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 25.sp,
            left: 20.sp,
            right: 20.sp,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the row content
              children: [
                Text(
                  'Read our', // The static text
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp, // Text size
                    color: Color.fromRGBO(158, 158, 158, 1), // Text color
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Action to perform when the button is pressed
                   // print('Sign Up Button Pressed!');
                  },
                  child: Text(
                    'Terms & Conditions', // The text displayed on the button
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp, // Button text size
                      color:
                          Color.fromRGBO(213, 76, 68, 1), // Button text color
                    ),
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
