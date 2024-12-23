import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String selectedCategory = "Images";

  // Sample list of images and videos
  final List<String> images = [
    "assets/clean1.png",
    "assets/cleansweap.png",
    "assets/spotless.png",
    "assets/clean1.png",
    "assets/cleansweap.png",
    "assets/spotless.png",
  ];
  final List<String> videos = [
    "assets/spotless.png",
    "assets/clean1.png",
    "assets/cleansweap.png",
  ];

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 60.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    "My Uploads",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Mulish",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(top: 2.sp, left: 20.sp, right: 20.sp),
                    height: 35.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(27.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add new",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Icon(Icons.add_circle_outline, size: 18.sp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            categorySection(),
            SizedBox(height: 10.h),
            // GridView.builder for displaying images or videos
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 1,
                ),
                itemCount: selectedCategory == "Images" ? images.length : videos.length,
                itemBuilder: (context, index) {
                  String asset = selectedCategory == "Images" ? images[index] : videos[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: AssetImage(asset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categorySection() {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: Row(
        children: [
          categoryButton("Images"),
          SizedBox(width: 15.w),
          categoryButton("Videos"),
        ],
      ),
    );
  }

  // Widget for category button
  Widget categoryButton(String category) {
    return GestureDetector(
      onTap: () {
        selectCategory(category);
      },
      child: Column(
        children: [
          Text(
            category,
            style: TextStyle(
              color: selectedCategory == category ? Colors.black : Colors.grey,
            ),
          ),
          selectedCategory == category
              ? Container(
                  height: 4.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
