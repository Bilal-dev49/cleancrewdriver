import 'dart:convert';
import 'package:cleancrewdriver/modes/driverMode/orderdetails/orderdetailscreen.dart';
import 'package:cleancrewdriver/modes/driverMode/settingscreen/profilesetting/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cleancrewdriver/modes/driverMode/settingscreen/settingscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  Map<String, dynamic>? jsonData;

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
    if (jsonData == null) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Good morning!',
          style: TextStyle(
            color: Color.fromRGBO(108, 108, 108, 1),
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 240.h,
              width: 220.w,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(208, 208, 208, 1),
                      radius: 35.r,
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 40.sp,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Adeline Bowman',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Mulish"),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      'adebowman129@gmail.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Mulish"),
                    ),
                    SizedBox(
                      height: 8.h,
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.person_outline, size: 20.sp, color: Colors.black),
              title: Text('Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins")),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.euro, size: 20.sp, color: Colors.black),
              title: Text('Earning',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins")),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined,
                  size: 20.sp, color: Colors.black),
              title: Text('Settings',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins")),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.logout_rounded, size: 20.sp, color: Colors.black),
              title: Text('Logout',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins")),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New jobs",
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
            Expanded(child: NewJobsList(jobs: jsonData!['newJobs'])),
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

  JobStatus({
    required this.newJobs,
    required this.ongoingJobs,
    required this.completedJobs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JobStatusCard(label: 'New jobs', count: newJobs, isActive: true),
        JobStatusCard(
            label: 'Ongoing jobs', count: ongoingJobs, isActive: false),
        JobStatusCard(
            label: 'Completed jobs', count: completedJobs, isActive: false),
      ],
    );
  }
}

class JobStatusCard extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;

  const JobStatusCard(
      {required this.label, required this.count, this.isActive = false});

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
          label == "New jobs"
              ? Icon(
                  Icons.calendar_today_outlined,
                  size: 20.sp,
                  color: isActive ? Colors.white : Colors.black,
                )
              : label == "Ongoing jobs"
                  ? Icon(
                      Icons.replay,
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
                color:
                    isActive ? Colors.white : Color.fromRGBO(108, 108, 108, 1),
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

class NewJobsList extends StatelessWidget {
  final List<dynamic> jobs;

  NewJobsList({required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return NewJobCard(
          job: job,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDetailsScreen()));
          },
        );
      },
    );
  }
}

class NewJobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final VoidCallback onTap;

  NewJobCard({required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 353.w,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Order #${job['orderId']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Mulish"),
                    ),
                    SizedBox(width: 8.w),
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
                        job['status'],
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
                        'Time remaining ${job['timeRemaining']}',
                        style: TextStyle(color: Colors.black, fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                  size: 12.sp,
                ),
                SizedBox(width: 5.w),
                Row(
                  children: [
                    Text(
                      'Pick Up: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      job['pickupTime'],
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                  size: 14.sp,
                ),
                SizedBox(width: 5.w),
                Row(
                  children: [
                    Text(
                      'Address: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      job['address'],
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Earning: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: "Mulish"),
                ),
                Text(
                  '£ ${job['earning'].toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontFamily: "Mulish"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
