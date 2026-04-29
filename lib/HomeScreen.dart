import 'package:flutter/material.dart';
import 'package:home/service_details.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginPage',
      routes: {
        'LoginPage': (context) => LoginPage(),
        'SignupPage': (context) => SignupPage(),
        'HomeScreen': (context) => HomeScreen(),

      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedLocation;


  @override
  void initState() {
    super.initState();
    selectedLocation = 'All';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0, // Add elevation for a material-like look
        backgroundColor: Colors.redAccent,
        title: Text(
          'Car Care',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto', // Set custom font for the title
          ),
        ),
        centerTitle: true, // Center the title horizontally
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(16.0), // Add padding to the grid view
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: carServices.length,
        itemBuilder: (context, index) {
          return ServiceTile(carService: carServices[index]);
        },
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final CarService carService;

  ServiceTile({required this.carService});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsPage(carService: carService),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              carService.icon,
              size: 50.0,
              color: Colors.red, // Set the icon color
            ),
            SizedBox(height: 10.0),
            Text(
              carService.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarService {
  final String name;
  final IconData icon;
  final List<Shop> shops;

  CarService({required this.name, required this.icon, required this.shops});
}

class Shop {
  final String name;
  final String address;
  final String location;
  final String description;
  final String imagePath;
  final String service;
  final String Price;

  Shop({
    required this.name,
    required this.address,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.service,
    required this.Price,
  });
}

List<CarService> carServices = [
  CarService(
    name: 'Oil Change',
    icon: Icons.local_gas_station,
    shops: [
      Shop(
        name: 'SHRI AUTO CARE',
        address: 'Shop No. 105K/25, Ameya Apartments, Agalli - Fatorda, Margao, Goa 403602',
        location: 'Fatorda',
        description: 'Revitalize your car\'s engine with our premium oil change service at SHRI AUTO CARE. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'oil change',
        Price: 'Price:500',
      ),
      Shop(
        name: 'West Coast Auto Service',
        address: 'Margao, Goa 403713, 87/A Godinho Waddo, Majorda Nuvem Road, Calata Majorda',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at West Coast Auto Service. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car1.jpg',
        service: 'oil change',
        Price: 'Price:500',
      ),
      Shop(
        name: 'Dada garage 24 hours Car Mechanic in Margao',
        address: 'near Krishna mandir, Calconda, Sanscar Society, Margao, Goa 403601',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at Dream car service. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car1.png',
        service: 'oil change',
        Price: 'Price:500',
      ),
      Shop(
        name: 'Dinesh Car Service',
        address: 'Cupangale Society, Margao, Goa 403601',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at Dream car service. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car1.png',
        service: 'oil change',
        Price: 'Price:500',
      ),
      Shop(
        name: 'Car care',
        address: 'Palolem, Canacona, Goa 403702',
        location: 'Navelim',
        description: 'Refresh your ride with our shop efficient oil change service! Our seasoned professionals offer swift oil and filter replacement, comprehensive inspections, and fluid top-ups. Enjoy convenience, quality, and peace of mind – book your appointment now',
        imagePath: 'assets/car1.png',
        service: 'oil change',
        Price: 'Price:500',
      ),
      Shop(
        name: 'Naz Auto Motors',
        address: 'Shop No. 4, mahbood tower, Arlem circle, near tata motors, Fatorda, Goa 403602',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at Dream car service. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car1.png',
        service: 'oil change',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'Towing service',
    icon: Icons.car_crash,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at XYZ Car Shop. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'Service Station',
    icon: Icons.car_repair,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: 'Margao',
        description: 'Revitalize your car\'s engine with our premium oil change service at XYZ Car Shop. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'Wheel Alignment',
    icon: Icons.tire_repair,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: '',
        description: '',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'Car Wash',
    icon: Icons.local_car_wash,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: '',
        description: '',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'AC Service',
    icon: Icons.ac_unit,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: '',
        description: '',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
  CarService(
    name: 'Diagnostic Service',
    icon: Icons.medical_services_outlined,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: '',
        description: '',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),

  CarService(
    name: 'Battery Replacement',
    icon: Icons.battery_alert ,
    shops: [
      Shop(
        name: 'Alfa Garage',
        address: '123 Main St',
        location: 'Navelim',
        description: 'Revitalize your car\'s engine with our premium oil change service at Alfa Garage. Experience optimal performance and engine longevity with our expert technicians, top-quality oils, and efficient service. Trust us to keep your vehicle running smoothly on the road ahead.',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
      Shop(
        name: 'XYZ Car Shop',
        address: '456 Elm St',
        location: '',
        description: '',
        imagePath: 'assets/car2.png',
        service: 'Towing service',
        Price: 'Price:500',
      ),
    ],
  ),
];
