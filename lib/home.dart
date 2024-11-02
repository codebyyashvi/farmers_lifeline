import 'package:farmers_lifeline/donation.dart';
import 'package:farmers_lifeline/farmersproblem.dart';
import 'package:farmers_lifeline/ngosandgov.dart';
import 'package:flutter/material.dart';
import 'package:farmers_lifeline/learning.dart';
import 'package:farmers_lifeline/registration.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.monitor_heart, // Choose any icon, like monitor heart
          color: Colors.white,
        ),
        title: const Text("Farmer's Lifeline", style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("images/farmer.jpg"),
          //   fit: BoxFit.cover,
          // ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade50, // Start color
              Colors.lightBlue.shade300, // End color
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              _buildOptionButton(context, "Learn Farming", Icons.agriculture, Colors.green, () {
                // Navigate to Learn Farming page
                Navigator.push(context, MaterialPageRoute(builder: (context) => Learning()));
              }),
              const SizedBox(height: 30),
              _buildOptionButton(context, "Farmer's Problems", Icons.warning, Colors.orange, () {
                // Navigate to Farmer's Problems page
                Navigator.push(context, MaterialPageRoute(builder: (context) => FarmersProblem()));
              }),
              const SizedBox(height: 30),
              _buildOptionButton(context, "NGOs & Government Schemes", Icons.account_balance, Colors.blue, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NgosAndGov()));// Navigate to NGOs & Government Schemes page
              }),
              const SizedBox(height: 30),
              _buildOptionButton(context, "Donation", Icons.volunteer_activism, Colors.red, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DonationPage()));// Navigate to Donation page
              }),
              const SizedBox(height: 250),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationPage()),
                    );// Add functionality for NGO and government registration here
                  },
                  child: const Text(
                    "Registration for NGOs",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,// Adds underline to the text
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Increases button size
        minimumSize: const Size.fromHeight(70), // Sets a minimum height for each button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.white, size: 32), // Sets icon size
      label: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20), // Sets font size
      ),
      onPressed: onPressed,
    );
  }

}
