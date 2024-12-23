import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Reusable custom TextField widget
class MyTextField extends StatelessWidget {
  final String hintText; // Placeholder text
  final TextEditingController? controller; // Optional controller for TextField
  final bool obscureText;
  final Icon prefixIcon;
  final IconButton? suffixIcon;

  MyTextField({
    required this.hintText,
    this.controller,
    required this.obscureText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 5.w),
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Color.fromRGBO(158, 158, 158, 1),
            fontWeight: FontWeight.w400,
            fontFamily: "Mulish",
          ),
          fillColor: Color.fromRGBO(208, 208, 208, 0.3),
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: Color.fromRGBO(158, 158, 158, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
