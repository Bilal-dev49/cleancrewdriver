import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGestureDetector extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  CustomGestureDetector({super.key, required this.onTap,  required this.text, required this.icon});

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: Colors.black,
                    size: 26.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                    ),
                  )
                ],
              ),
    );
  }
}