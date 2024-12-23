import 'package:cleancrewdriver/modes/cleanerMode/bookingcards/upcomingcard.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart' show rootBundle;

class CleanerHomeScreen extends StatefulWidget {
  const CleanerHomeScreen({super.key});

  @override
  State<CleanerHomeScreen> createState() => _CleanerHomeScreenState();
}

class _CleanerHomeScreenState extends State<CleanerHomeScreen> {
  Map<String, dynamic>? jsonData;
  int selectedJobIndex = 0; // Track the selected card index

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    setState(() {
      jsonData = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Good morning!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Mulish",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EarningsCard(totalEarning: jsonData!['totalEarning']),
            SizedBox(height: 20.h),
            SizedBox(
              height: 100.h,
              width: 353.w,
              child: JobStatus(
                newJobs: jsonData!['jobStatus']['newJobs'],
                ongoingJobs: jsonData!['jobStatus']['ongoingJobs'],
                completedJobs: jsonData!['jobStatus']['completedJobs'],
                selectedJobIndex: selectedJobIndex,
                onCardTap: (index) {
                  setState(() {
                    selectedJobIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Booking requests",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 14.h,
                    width: 62.w,
                    child: Row(
                      children: [
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 12.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(child: BookingDetailsList())
          ],
        ),
      ),
    );
  }
}

class EarningsCard extends StatelessWidget {
  final double totalEarning;

  EarningsCard({required this.totalEarning});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 353.w,
        height: 140.h,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Earning',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(19, 19, 19, 1),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Mulish"),
            ),
            SizedBox(height: 8.h),
            Text(
              '£ ${totalEarning.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Color.fromRGBO(19, 19, 19, 1),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish"),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromRGBO(19, 19, 19, 1),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Mulish"),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_forward,
                      color: Color.fromRGBO(19, 19, 19, 1), size: 17.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobStatus extends StatelessWidget {
  final int newJobs;
  final int ongoingJobs;
  final int completedJobs;
  final int selectedJobIndex;
  final Function(int) onCardTap;

  JobStatus({
    required this.newJobs,
    required this.ongoingJobs,
    required this.completedJobs,
    required this.selectedJobIndex,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onCardTap(0),
          child: JobStatusCard(
            label: 'Upcoming jobs',
            count: newJobs,
            isActive: selectedJobIndex == 0,
          ),
        ),
        GestureDetector(
          onTap: () => onCardTap(1),
          child: JobStatusCard(
            label: 'Canceled jobs',
            count: ongoingJobs,
            isActive: selectedJobIndex == 1,
          ),
        ),
        GestureDetector(
          onTap: () => onCardTap(2),
          child: JobStatusCard(
            label: 'Completed jobs',
            count: completedJobs,
            isActive: selectedJobIndex == 2,
          ),
        ),
      ],
    );
  }
}

class JobStatusCard extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;

  const JobStatusCard({
    required this.label,
    required this.count,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.w,
      height: 95.h,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          label == "Upcoming jobs"
              ? Icon(
                  Icons.calendar_today_outlined,
                  size: 20.sp,
                  color: isActive ? Colors.white : Colors.black,
                )
              : label == "Canceled jobs"
                  ? Icon(
                      Icons.warning_amber_rounded,
                      size: 20.sp,
                      color: isActive ? Colors.white : Colors.black,
                    )
                  : label == "Completed jobs"
                      ? Icon(
                          Icons.note_alt_outlined,
                          size: 20.sp,
                          color: isActive ? Colors.white : Colors.black,
                        )
                      : SizedBox(),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
                color: isActive ? Colors.white : Color.fromRGBO(108, 108, 108, 1),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Mulish"),
          ),
          SizedBox(height: 8.h),
          Text(
            '$count',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
                color: isActive ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}

