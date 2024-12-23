import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class BookingDetails {
  final String date;
  final String time;
  final String name;
  final String address;
  final String status;
  final String specialInstructions;
  final String productPreference;
  final String laundry;
  final String payment;

  BookingDetails({
    required this.date,
    required this.time,
    required this.name,
    required this.address,
    required this.status,
    required this.specialInstructions,
    required this.productPreference,
    required this.laundry,
    required this.payment,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      date: json['booking_details']['date'],
      time: json['booking_details']['time'],
      name: json['client_details']['name'],
      address: json['client_details']['address'],
      status: json['status'],
      specialInstructions: json['additional_details']['special_instructions'],
      productPreference: json['additional_details']['product_preference'],
      laundry: json['additional_details']['laundry'],
      payment: json['additional_details']['payment'],
    );
  }
}

class BookingDetailsList extends StatefulWidget {
  @override
  _BookingDetailsListState createState() => _BookingDetailsListState();
}

class _BookingDetailsListState extends State<BookingDetailsList> {
  List<BookingDetails> bookings = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadBookingDetails();
  }

  Future<void> loadBookingDetails() async {
    print("Loading booking details...");
    try {
      final String response =
          await rootBundle.loadString('assets/dataupcoming.json');
      print("Loaded JSON: $response");

      final data = json.decode(response);
      print("Parsed JSON: $data");

      setState(() {
        bookings = (data['bookings'] as List)
            .map((bookingJson) => BookingDetails.fromJson(bookingJson))
            .toList();
        errorMessage = null;
      });

      print("Data loaded successfully: ${bookings.length} bookings");
    } catch (error) {
      setState(() {
        errorMessage = "Failed to load bookings: $error";
      });
      print("Error loading data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return bookings.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return BookingDetailsCard(booking: bookings[index]);
            },
          );
  }
}

class BookingDetailsCard extends StatelessWidget {
  final BookingDetails booking;

  BookingDetailsCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingClientDetails(booking: booking),
          Divider(color: Colors.black12, height: 20, thickness: 1),
          AdditionalDetails(booking: booking),
        ],
      ),
    );
  }
}

class BookingClientDetails extends StatelessWidget {
  final BookingDetails booking;

  BookingClientDetails({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Booking details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Row(children: [
            Icon(Icons.calendar_today, size: 14, color: Colors.black54),
            SizedBox(width: 8),
            Text(booking.date,
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
          Row(children: [
            Icon(Icons.access_time, size: 14, color: Colors.black54),
            SizedBox(width: 8),
            Text(booking.time,
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Client details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Row(children: [
            Icon(Icons.person, size: 14, color: Colors.black54),
            SizedBox(width: 8),
            Text(booking.name,
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
          Row(children: [
            Icon(Icons.location_on, size: 14, color: Colors.black54),
            SizedBox(width: 8),
            Text(booking.address,
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
        ]),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(booking.status,
                  style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
            Icon(Icons.more_vert, color: Colors.black54),
          ],
        ),
      ],
    );
  }
}

class AdditionalDetails extends StatelessWidget {
  final BookingDetails booking;

  AdditionalDetails({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRow(
            label: "Special instructions", value: booking.specialInstructions),
        DetailRow(
            label: "Product preference", value: booking.productPreference),
        DetailRow(label: "Laundry", value: booking.laundry),
        DetailRow(label: "Payment", value: booking.payment),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
          SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 12, color: Colors.black)),
        ]),
      ],
    );
  }
}
