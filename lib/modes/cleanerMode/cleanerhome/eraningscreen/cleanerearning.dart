import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerEarning extends StatefulWidget {
  const CleanerEarning({super.key});

  @override
  State<CleanerEarning> createState() => _CleanerEarningState();
}

class _CleanerEarningState extends State<CleanerEarning> {
  String selectedCard = 'All';
  List transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  // Load JSON data from file
  Future<void> loadTransactions() async {
    final String response =
        await rootBundle.loadString('assets/cleanertransaction.json');
    final data = await json.decode(response);
    setState(() {
      transactions = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80.sp, left: 20.sp, right: 20.sp),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Earning",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Mulish"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "£ 1,260.00 ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Mulish"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 7.sp, left: 30.sp),
                      height: 35.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(27.r)),
                      child: Text(
                        "Withdraw",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction history",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000), // Earliest date allowed
                      lastDate: DateTime(2100), // Latest date allowed
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor:
                                Colors.white, // Header background color
                            colorScheme: ColorScheme.light(
                              primary: Colors
                                  .black, // Header text and selected date circle color
                              onSurface: Colors.black, // Text color in calendar
                            ), dialogTheme: DialogThemeData(backgroundColor: Colors
                                .white), // Background color of the date picker
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectedDate != null) {
                      // You can handle the selected date here
                      print("Selected date: ${selectedDate.toLocal()}");
                      // Optional: Add logic to filter transactions based on selected date
                    }
                  },
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPaymentMethodCard(
                      "All", Colors.black, selectedCard == 'All'),
                  SizedBox(
                    width: 14.w,
                  ),
                  _buildPaymentMethodCard(
                      "Visa card", Colors.black, selectedCard == 'Visa card'),
                  SizedBox(
                    width: 14.w,
                  ),
                  _buildPaymentMethodCard(
                      "Mastercard", Colors.black, selectedCard == 'Mastercard'),
                  SizedBox(
                    width: 14.w,
                  ),
                  _buildPaymentMethodCard(
                      "Apple Pay", Colors.black, selectedCard == 'Apple Pay'),
                  SizedBox(
                    width: 14.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return _buildTransactionCard(transaction);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(String method, Color color, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = method;  // Update selected card
        });
      },
      child: Container(
        width: 142.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected ? color : Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the correct image based on the selected card
            Text(
              method,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
              ),
            ),
            Image(
              image: _getPaymentMethodIcon(method),
              color: method == "Apple Pay"
                  ? (selectedCard == "Apple Pay"
                      ? Colors.white
                      : Colors.black) // White if selected, black if not
                  : method == "All"
                      ? (selectedCard == "All" ? Colors.white : Colors.black)
                      : null, // Call the helper function here
              width: 40.w, // Adjust the width as needed
              height: 40.h, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }

  AssetImage _getPaymentMethodIcon(String method) {
    switch (method) {
      case 'Visa card':
        return AssetImage("assets/visaIcon.png");
      case 'Mastercard':
        return AssetImage("assets/masterIcon.png");
      case 'Apple Pay':
        return AssetImage("assets/appleIcon.png");
      default:
        return AssetImage(
            "assets/defaultIcon.png"); // Default or fallback image
    }
  }

  Widget _buildTransactionCard(Map<String, dynamic> transaction) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 1),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${transaction['paymentMethod']} transaction",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Mulish",
                    ),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  size: 18.sp,
                  color: Colors.black,
                ),
              ],
            ),
            Divider(color: Colors.black.withOpacity(0.1), height: 20.h),
            _buildTransactionDetail("Date", transaction['date']),
            _buildTransactionDetail(
                "Payment method", transaction['paymentMethod']),
            _buildTransactionDetail("Amount", transaction['amount']),
            _buildTransactionDetail(
              "Status",
              transaction['status'],
              statusColor: transaction['status'] == "Completed"
                  ? Color.fromRGBO(78, 175, 80, 1)
                  : transaction['status'] == "Failed"
                      ? Color.fromRGBO(243, 75, 80, 1)
                      : transaction['status'] == "Pending"
                          ? Color.fromRGBO(234, 218, 5, 0.913)
                          : Color.fromRGBO(158, 158, 158, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetail(String label, String value,
      {Color? statusColor}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: "Mulish",
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: statusColor ?? Color.fromRGBO(158, 158, 158, 1),
            fontFamily: "Mulish",
          ),
        ),
      ],
    );
  }
}
