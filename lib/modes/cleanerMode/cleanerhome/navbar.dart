import 'package:cleancrewdriver/modes/cleanerMode/cleanerhome/cleanerhomescreen.dart';
import 'package:cleancrewdriver/modes/cleanerMode/cleanerhome/eraningscreen/cleanerearning.dart';
import 'package:cleancrewdriver/modes/cleanerMode/cleanerhome/uploadscreen/uploadscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CleanerHomeScreen(),
    CleanerEarning(),
    UploadScreen(),
    

    Text("Home"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 24.0.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, "Home", 0),
            _buildNavItem(Icons.euro, "Earnings", 1),
            _buildNavItem(Icons.file_upload_outlined, "Uploads", 2),
            _buildNavItem(Icons.settings_outlined, "Settings", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData iconData, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: isSelected
            ? EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp)
            : EdgeInsets.all(0),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30.r),
              )
            : BoxDecoration(),
        child: Row(
          children: [
            Icon(
              iconData,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(left: 8.0.sp),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
