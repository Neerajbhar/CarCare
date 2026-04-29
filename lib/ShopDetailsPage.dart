import 'package:flutter/material.dart';
import 'package:home/HomeScreen.dart' as main;

import 'BookingPage.dart';

class ShopDetailsPage extends StatelessWidget {
  final main.Shop shop;

  ShopDetailsPage({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage(shop.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      ' ${shop.name}',
                      style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  Text(
                    'Address',
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    ' ${shop.address}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'About ${shop.name}:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    shop.description,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price',
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    ' ${shop.Price}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement locating functionality
              },
              child: Text(
                'Locate',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(150, 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the BookingPage with the selected service name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(
                      serviceName: shop.name,
                      location: shop.location,
                      service: shop.service,
                      price: shop.Price,
                    ),
                  ),
                );
              },
              child: Text(
                'Book',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(150, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

