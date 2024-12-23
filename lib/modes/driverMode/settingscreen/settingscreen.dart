
import 'package:cleancrewdriver/Auth/getstarted.dart';
import 'package:cleancrewdriver/modes/driverMode/privacypolicyscreen/privacypolicy.dart';
import 'package:cleancrewdriver/modes/driverMode/settingscreen/changepassword.dart';
import 'package:cleancrewdriver/modes/driverMode/settingscreen/customGestureDetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.5.sp, right: 20.5.sp, top: 20.sp),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                          size: 26.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            Text(
                              "Notifications",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Mulish",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Switch(
                      value: !isSwitched,
                      onChanged: (value ) {
                        setState(() {
                          isSwitched =
                              value; // Update the state with the new value
                        });
                      },
                      activeTrackColor:
                          const Color.fromARGB(255, 170, 224, 107),
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade300,
                      inactiveThumbColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                
                CustomGestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(),
                        ),
                      );
                    },
                    text: "Change Password",
                    icon: Icons.key_outlined),
                SizedBox(
                  height: 25.h,
                ),
                CustomGestureDetector(
                    onTap: () {},
                    text: "Language & Region",
                    icon: Icons.language_outlined),
                SizedBox(
                  height: 30.h,
                ),
                CustomGestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    text: "Privacy Policy",
                    icon: Icons.lock_outline),
                SizedBox(
                  height: 30.h,
                ),
                CustomGestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    text: "Terms and Conditions",
                    icon: Icons.insert_drive_file_outlined),
                SizedBox(
                  height: 30.h,
                ),
                 CustomGestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PrivacyPolicyScreen(),
                      //   ),
                      // );
                    },
                    text: "Instant Messaging",
                    icon: Icons.chat_bubble_outline),
                SizedBox(
                  height: 30.h,
                ),
                CustomGestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Getstarted(),
                        ),
                      );
                    },
                    text: "Logout",
                    icon: Icons.logout_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
