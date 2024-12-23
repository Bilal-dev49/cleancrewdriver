
import 'package:cleancrewdriver/modes/driverMode/driverhomescreen.dart';
import 'package:cleancrewdriver/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
        title: Text(
          "My profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.5.sp, right: 20.5.sp),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? Container(
                            height: 98.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(13.r),
                              image: DecorationImage(
                                image: FileImage(
                                    _image!), // Display the selected image
                                fit: BoxFit.fill, // Cover the entire container
                              ),
                            ),
                          )
                        : Container(
                            height: 98.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(158, 158, 158, 0.2),
                              borderRadius: BorderRadius.circular(13.r),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: 50.sp,
                              color: Color.fromRGBO(158, 158, 158, 1),
                            ),
                          ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          _showImagePickerDialog();
                        },
                        child: Container(
                          width: 30.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Icon(Icons.camera_alt_outlined,
                              size: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              MyTextField(
                hintText: "User name",
                obscureText: false,
                prefixIcon: Icon(Icons.person_outlined),
              ),
              MyTextField(
                hintText: "user@gmail.com",
                obscureText: false,
                prefixIcon: Icon(Icons.mail_outline),
              ),
              MyTextField(
                hintText: "Ext. +92 0000000000",
                obscureText: false,
                prefixIcon: Icon(Icons.phone_iphone_outlined),
              ),
              MyTextField(
                hintText: "House # XYZ, Street # abc",
                obscureText: false,
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 5.w, vertical: 8.h),
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
