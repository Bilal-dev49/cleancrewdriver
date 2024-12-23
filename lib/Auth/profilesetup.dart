import 'package:cleancrewdriver/Auth/login.dart';
import 'package:cleancrewdriver/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class MyProfileSetup extends StatefulWidget {
  const MyProfileSetup({super.key});

  @override
  State<MyProfileSetup> createState() => _MyProfileSetupState();
}

class _MyProfileSetupState extends State<MyProfileSetup> {
  File? _image; // This will store the picked image
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the picked image to the File
      });
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choose Image Source',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.camera_alt, size: 20.sp, color: Colors.black),
                title: Text(
                  'Camera',
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _pickImage(ImageSource.camera); // Pick from camera
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.photo_library, size: 20.sp, color: Colors.black),
                title: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _pickImage(ImageSource.gallery); // Pick from gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          iconSize: 20.sp,
          icon: Icon(
            Icons.close,
          ), // Back button icon
          onPressed: () {
            // Action when the back button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.5.sp, right: 20.5.sp),
          child: Column(
            children: [
              SizedBox(
                height: 65.h,
                width: 284.w,
                child: Column(
                  children: [
                    Text(
                      "Profile Setup",
                      style: TextStyle(
                        fontSize: 26.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Mulish",
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      "Let’s us know about you",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(158, 158, 158, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: Column(
                  children: [
                    _image != null
                        ? GestureDetector(
                            onTap: () {
                              _showImagePickerDialog();
                            },
                            child: Container(
                              height: 98.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(13.r),
                                image: DecorationImage(
                                  image: FileImage(
                                      _image!), // Display the selected image
                                  fit:
                                      BoxFit.fill, // Cover the entire container
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _showImagePickerDialog();
                            },
                            child: Container(
                              height: 98.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(158, 158, 158, 0.19),
                                borderRadius: BorderRadius.circular(13.r),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 20.sp,
                                color: Color.fromRGBO(158, 158, 158, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text("Upload profile image", style: TextStyle(color: Colors.black, fontSize: 10.sp, fontFamily: "Mulish"),)
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              MyTextField(
                hintText: "Name",
                obscureText: false,
                prefixIcon: Icon(Icons.person_outlined),
              ),
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 5.w),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 60.sp,),
                      child: Icon(
                        Icons.person_pin,
                      ),
                    ),
                    prefixIconColor: Color.fromRGBO(158, 158, 158, 1),
                    hintText: "About",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Mulish",
                    ),
                    fillColor: Color.fromRGBO(208, 208, 208, 0.3),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  maxLines: 4,
                ),
              ),
              MyTextField(
                hintText: "Address",
                obscureText: false,
                prefixIcon: Icon(Icons.location_on_outlined),
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
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              'Continue',
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
