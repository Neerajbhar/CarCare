import 'package:flutter/material.dart';
import 'package:home/HomeScreen.dart';
import 'package:home/ShopDetailsPage.dart';

class ServiceDetailsPage extends StatefulWidget {
  final CarService carService;

  ServiceDetailsPage({required this.carService});

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  late String selectedLocation;
  final List<String> locations = ['All', 'Margao', 'Navelim', 'Fatorda'];

  @override
  void initState() {
    super.initState();
    selectedLocation = 'All';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carService.name),
        backgroundColor: Colors.red, // Set the app bar background color
        actions: [
          DropdownButton<String>(
            value: selectedLocation,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedLocation = newValue;
                });
              }
            },
            items: locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: _buildShopCards(),
      ),
    );
  }

  List<Widget> _buildShopCards() {
    final List<Shop> filteredShops = selectedLocation == 'All'
        ? widget.carService.shops
        : widget.carService.shops.where((shop) => shop.location == selectedLocation).toList();

    return filteredShops.map((shop) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopDetailsPage(shop: shop)),
          );
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.red, // Set the card background color
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Set the text color
                ),
                SizedBox(height: 8),
                Text(
                  shop.address,
                  style: TextStyle(fontSize: 16, color: Colors.white), // Set the text color
                ),

              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
