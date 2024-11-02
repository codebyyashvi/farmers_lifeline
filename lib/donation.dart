import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  List<Map<String, dynamic>> donations = [];

  @override
  void initState() {
    super.initState();
    _loadDonationDetails(); // Load stored data on app start
  }

  // Method to load donation details from SharedPreferences
  Future<void> _loadDonationDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final donationData = prefs.getString('donations');

    if (donationData != null) {
      final List<dynamic> donationList = jsonDecode(donationData);
      setState(() {
        donations = donationList.map((data) => data as Map<String, dynamic>).toList();
      });
    }
  }

  // Method to save donation details to SharedPreferences
  Future<void> _saveDonationDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('donations', jsonEncode(donations));
  }

  // Function to collect and save donation details after navigating to the form page
  Future<void> _registerDonation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DonationFormPage()),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        donations.add(result);
      });
      await _saveDonationDetails(); // Save donation details to persist after each submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightBlue.shade50,
                  Colors.lightBlue.shade300,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: donations.isNotEmpty
                  ? ListView.builder(
                itemCount: donations.length,
                itemBuilder: (context, index) {
                  final donation = donations[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${donation['name']}', style: const TextStyle(fontSize: 18)),
                        Text('Mobile No.: ${donation['mobile']}', style: const TextStyle(fontSize: 18)),
                        Text('Amount: \$${donation['amount'].toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                },
              )
                  : const Text('No donations made yet.', style: TextStyle(fontSize: 18)),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button color to blue
              ),
              onPressed: () => _registerDonation(context),
              child: const Text('Donate'),
            ),
          ),
        ],
      ),
    );
  }
}

class DonationFormPage extends StatefulWidget {
  const DonationFormPage({Key? key}) : super(key: key);

  @override
  State<DonationFormPage> createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // Method to submit donation form and pass data back to DonationPage
  void _submitDonation() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'name': _nameController.text,
        'mobile': _mobileController.text,
        'amount': double.parse(_amountController.text),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Donation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade300,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  controller: _mobileController,
                  decoration: const InputDecoration(labelText: 'Mobile No.'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color to blue
                  ),
                  onPressed: _submitDonation,
                  child: const Text('Submit Donation'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
