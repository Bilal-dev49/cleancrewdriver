import 'package:cleancrewdriver/modes/driverMode/driverhomescreen.dart';
import 'package:cleancrewdriver/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                hintText: "Old password",
                obscureText: true,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.password),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: Text(
                  "use letter, symbols and numbers to create strong password",
                  style: TextStyle(color: Colors.black, fontSize: 10.sp),
                ),
              ),
              MyTextField(
                hintText: "New password",
                obscureText: true,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.password),
                ),
              ),
              MyTextField(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 20.5.sp, right: 20.5.sp, top: 10.25.sp, bottom: 15.sp),
        child: SizedBox(
          height: 55.h,
          width: 353.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r), // Rounded edges
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DriverHomeScreen()),
              );
            },
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
