import 'package:flutter/material.dart';
import 'PaymentPage.dart';

class BookingPage extends StatefulWidget {
  final String serviceName;
  final String? location;
  final String service;
  final String price;

  BookingPage({required this.serviceName, this.location, required this.service, required this.price});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>(); // Add form key

  late String _name = '';
  late String _phoneNumber = '';
  late String _email = '';
  late String _carModel = '';
  late String _date = '';

  DropOption _dropOption = DropOption.self; // Selected drop option

  late String _pickupAddress = '';
  late String _dropAddress = '';

  late String selectedTimeSlot = timeSlots.first;
  List<String> timeSlots = [
    '9:00-10:00',
    '9:30-10:30', // Added slot
    '10:00-11:00',
    '10:30-11:30', // Added slot
    '11:00-12:00',
    // Add more slots as needed
  ];

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _date = pickedDate.toLocal().toString().split(' ')[0]; // Extract only the date part
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Service'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Wrap with SingleChildScrollView to make the page scrollable
          child: Form(
            key: _formKey, // Assign form key to the form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Service Name: ${widget.serviceName}'),
                if (widget.location != null) Text('Location: ${widget.location}'),
                Text('Service: ${widget.service}'),
                Text(' ${widget.price}'), // Show the price
                SizedBox(height: 20),
                Text(
                  'Booking Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Radio<DropOption>(
                      value: DropOption.self,
                      groupValue: _dropOption,
                      onChanged: (DropOption? value) {
                        setState(() {
                          _dropOption = value!;
                        });
                      },
                    ),
                    Text('Self-drop'),
                    Radio<DropOption>(
                      value: DropOption.pickAndDrop,
                      groupValue: _dropOption,
                      onChanged: (DropOption? value) {
                        setState(() {
                          _dropOption = value!;
                        });
                      },
                    ),
                    Text('Pick and Drop'),
                  ],
                ),
                if (_dropOption == DropOption.pickAndDrop) ...[
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Pickup Address'),
                    onChanged: (value) {
                      setState(() {
                        _pickupAddress = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Drop Address'),
                    onChanged: (value) {
                      setState(() {
                        _dropAddress = value;
                      });
                    },
                  ),
                ],
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vehicle Number'),
                  onChanged: (value) {
                    setState(() {
                      _carModel = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                // Date TextFormField with calendar icon
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context), // Call function to show date picker
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        controller: TextEditingController(text: _date), // Set initial text
                        readOnly: true, // Make text field read-only
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Select Time Slot'),
                  value: selectedTimeSlot,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTimeSlot = newValue!;
                    });
                  },
                  items: timeSlots.map<DropdownMenuItem<String>>((String timeSlot) {
                    return DropdownMenuItem<String>(
                      value: timeSlot,
                      child: Text(timeSlot),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) { // Validate form
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              serviceName: widget.serviceName,
                              location: widget.location,
                              service: widget.service,
                              Price: widget.price,
                              name: _name,
                              phoneNumber: _phoneNumber,
                              email: _email,
                              carModel: _carModel,
                              date: _date,
                              selectedTimeSlot: selectedTimeSlot,
                              pickupAddress: _pickupAddress,
                              dropAddress: _dropAddress,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Confirm Booking'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DropOption {
  self,
  pickAndDrop,
}
