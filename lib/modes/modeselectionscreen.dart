import 'package:cleancrewdriver/Auth/getstarted.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModeSelectionScreen extends StatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  State<ModeSelectionScreen> createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends State<ModeSelectionScreen> {
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.5.sp,
          right: 20.5.sp,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image1.png"),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Select to continue as a",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "Mulish",
              ),
            ),
            SizedBox(height: 20.h),
            // Role selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cleaner Option
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = 'Cleaner';
                    });
                  },
                  child: RoleSelectionButton(
                    iconimage: "assets/cleanBrush.png",
                    label: "Cleaner",
                    isSelected: selectedRole == 'Cleaner',
                  ),
                ),
                SizedBox(width: 20.w),
                // Driver Option
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = 'Driver';
                    });
                  },
                  child: RoleSelectionButton(
                    iconimage: "assets/truckIcon.png",
                    label: "Driver",
                    isSelected: selectedRole == 'Driver',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.5.sp, right: 20.5.sp, bottom: 25.sp),
        child: SizedBox(
          height: 55.h,
          width: 353.w,
          child: ElevatedButton(
            onPressed: selectedRole == null
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Getstarted()),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedRole == null
                  ? Color.fromRGBO(158, 158, 158, 1)
                  : Colors.black, // Background color
              elevation: 0, // Elevation

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0.sp),
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                fontFamily: "Mulish",
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionButton extends StatelessWidget {
  final String iconimage;
  final String label;
  final bool isSelected;

  RoleSelectionButton({
    Key? key,
    required this.iconimage,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18.r),
      elevation: 1.5.sp,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.white,
          border:
              isSelected ? Border.all(color: Colors.black, width: 1.5.w) : null,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconimage),
            const SizedBox(height: 10),
            Text(label,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Mulish")),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.black, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
