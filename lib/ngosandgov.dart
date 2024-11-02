import 'package:farmers_lifeline/govschemes.dart';
import 'package:farmers_lifeline/ngos.dart';
import 'package:flutter/material.dart';

class NgosAndGov extends StatefulWidget {
  const NgosAndGov({super.key});

  @override
  State<NgosAndGov> createState() => _NgosAndGovState();
}

class _NgosAndGovState extends State<NgosAndGov> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Government Schemes & NGOs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Overview",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Government schemes and NGOs have significantly contributed to improving the lives of farmers by providing financial aid, resources, and training. Below are two sections that provide more details on available schemes and NGOs working towards empowering the farming community.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                "Success Rate: 85% of farmers report a positive impact from these programs.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // Government Schemes Button
              _buildInfoButton(
                context,
                "Government Schemes",
                Icons.account_balance,
                Colors.blue,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GovernmentSchemes()));// Navigate or show details about government schemes
                },
              ),
              const SizedBox(height: 20),

              // NGOs Button
              _buildInfoButton(
                context,
                "NGOs",
                Icons.volunteer_activism,
                Colors.green,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NGOsAndSchemesPage()));// Navigate or show details about NGOs
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoButton(
      BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.white, size: 28),
      label: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: onPressed,
    );
  }
}
