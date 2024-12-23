import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailTrack extends StatefulWidget {
  const OrderDetailTrack({super.key});

  @override
  State<OrderDetailTrack> createState() => _OrderDetailTrackState();
}

class _OrderDetailTrackState extends State<OrderDetailTrack> {
  Map<String, dynamic>? orderData;

  @override
  void initState() {
    super.initState();
    loadOrderData();
  }

  Future<void> loadOrderData() async {
    final String response =
        await rootBundle.loadString('assets/order_details.json');
    setState(() {
      orderData = json.decode(response);
    });
  }
  @override
  Widget build(BuildContext context) {
    if (orderData == null) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final client = orderData!['client'];
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Details',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Mulish"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 10.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 18.h,
                        width: 4.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            color: Colors.black),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Order #${orderData!['orderId']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: "Mulish"),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 20.h,
                        width: 45.w,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 193, 37, 1),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          orderData!['status'],
                          style: TextStyle(color: Colors.white, fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20.h,
                    width: 146.w,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(19, 19, 19, 0.06),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 11.sp,
                        ),
                        // SizedBox(width: 4),
                        Text(
                          'Time remaining ${orderData!['timeRemaining']}',
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 20.h),
          
              // Job Details
              Text(
                'Job Details',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Mulish"),
              ),
              SizedBox(height: 10.h),
              buildJobDetailRow('Assign date', orderData!['assignDate']),
              buildJobDetailRow('Pickup date', orderData!['pickupDate']),
              buildJobDetailRow('Pickup time', orderData!['pickupTime']),
              buildJobDetailRow('Location', orderData!['location']),
              buildJobDetailRow('Distance', orderData!['distance']),
              buildJobDetailRow('Instructions', orderData!['instructions']),
              Divider(height: 22.h, color: Colors.black),
              buildJobDetailRow(
                  'Earning', '£ ${orderData!['earning'].toStringAsFixed(2)}'),
          
              Divider(height: 22.h, color: Colors.black),
              SizedBox(height: 20.h),
              // Client Details
              Text(
                'Client details',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Mulish"),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(client['profileImage']),
                    radius: 30.r,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          client['name'],
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "Mulish"),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Icon(Icons.email_outlined,
                                size: 14.sp, color: Colors.black),
                            SizedBox(width: 4.w),
                            Text(
                              client['email'],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Mulish"),
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.phone_iphone_outlined,
                                size: 12.sp, color: Colors.black),
                            SizedBox(width: 4),
                            Text(
                              client['phone'],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Mulish"),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 14.sp,
                                color: Color.fromRGBO(213, 76, 68, 1)),
                            SizedBox(width: 4),
                            Text(
                              client['address'],
                              style: TextStyle(
                                  color: Color.fromRGBO(213, 76, 68, 1),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Mulish"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      child: Icon(Icons.call_outlined,
                          size: 22.sp, color: Colors.black.withOpacity(0.5))),
                ],
              ),
             SizedBox(height: 90.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  FloatingActionButton(onPressed: (){}),
                ],
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 15.sp),
        child: SizedBox(
          height: 55.h,
          width: 353.w,
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.2), // Background color
              elevation: 0, // Elevation

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0.sp),
              ),
            ),
            child: Text(
              "Mark as complete",
              style: TextStyle(
                  fontFamily: "Mulish",
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildJobDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish"),
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Mulish"),
          ),
        ],
      ),
    );
  }
}