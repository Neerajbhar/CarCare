import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final String serviceName;
  final String? location;
  final String service;
  final String name;
  final String phoneNumber;
  final String email;
  final String carModel;
  final String date;
  final String selectedTimeSlot;
  final String Price;

  final String pickupAddress;

  final String dropAddress;




  PaymentPage({
    required this.serviceName,
    this.location,
    required this.service,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.carModel,
    required this.date,
    required this.selectedTimeSlot,
    required this.Price,
    required this. pickupAddress,
    required this.dropAddress,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Service: $serviceName'),
            if (location != null) Text('Location: $location'),
            Text('Service: $service'),
            Text(' $Price'),
            SizedBox(height: 20),
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Display payment details here
            Text('Name: $name'),
            Text('Phone Number: $phoneNumber'),
            Text('Email: $email'),
            Text('Car Model: $carModel'),
            Text('Date: $date'),
            Text('Time: $selectedTimeSlot'),
            Text('pickupAddress:$pickupAddress'),
            Text('DropAddress:$dropAddress'),


            SizedBox(height: 20),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 50),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add payment functionality here
                  },
                  child: Text('Make Payment'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
