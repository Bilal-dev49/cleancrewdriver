
import 'package:cleancrewdriver/modes/modeselectionscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/bgImage2.png"), // Your background image
                fit: BoxFit.fill, // Cover the entire screen
              ),
            ),
          ),
          // Foreground content (add your UI elements here)
          
          Positioned(
            bottom: 40.0.sp,
            left: 20.sp,
            right: 20.sp,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 75.h,
                    width: 287.h,
                    child: Text(
                      "Welcome to The Clean Crew",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 28.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    height: 40.h,
                    width: 353.w,
                    child: Text(
                      "Manage your cleaning tasks efficiently with real-time updates.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  SizedBox(
                    height: 55.h,
                    width: 353.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ModeSelectionScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color
                        elevation: 0, // Elevation

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0.sp),
                        ),
                      ),
                      child: Text(
                        "Start now",
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
            ),
          )
        ],
      ),
    );
  }
}
