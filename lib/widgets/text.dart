import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final  String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      softWrap: true,
      style: TextStyle(
        fontSize: 13.sp,
        fontFamily: "Mulish",
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),

    );
  }
}