
import 'package:cleancrewdriver/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.5.sp, right: 20.5.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "Effective Date: [9/3/2024]"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "1. Introduction"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(
                    text:
                        "Welcome to The Clean Crew! We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile app and services."),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "2. Information We Collect"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(
                    text:
                        "Personal Information: We may collect personal information such as your name, email address, phone number, payment details, and profile information.\nService Data: Information about the services you book, preferences, and any special instructions.\nUsage Data: Data about how you use our app, including log data, device information, and interactions with our services.\nLocation Data: GPS location data to facilitate real-time tracking of service delivery."),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "3. How We Use Your Information"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(
                    text:
                        "We use your information for the following purposes:\n\nTo provide and manage our services, including processing bookings and payments.\nTo communicate with you, including sending notifications, updates, and marketing messages.\nTo improve our app and services based on usage data and feedback.\nTo ensure the security of our app and services and prevent fraud."),
              ),
              SizedBox(height: 20.h),
              
              SizedBox(
                width: 353.w,
                child: CustomText(text: "4. How We Share Your Information"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "We may share your information in the following circumstances:\n\nWith Service Providers: To fulfill service requests and manage bookings.\nWith Business Partners: For purposes related to payment processing and integration with third-party platforms.\nFor Legal Reasons: To comply with legal obligations or protect our rights."),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "5. Data Security"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "We implement security measures to protect your personal information from unauthorized access, use, or disclosure. This includes data encryption and secure authentication processes."),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "6. Your Choices"),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 353.w,
                child: CustomText(text: "You can manage your preferences regarding notifications and marketing communications through the app settings. You may also request access to, correction of, or deletion of your personal information by contacting us."),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
