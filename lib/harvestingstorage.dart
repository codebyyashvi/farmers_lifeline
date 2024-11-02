import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HarvestingStorage extends StatefulWidget {
  const HarvestingStorage({super.key});

  @override
  State<HarvestingStorage> createState() => _HarvestingStorageState();
}

class _HarvestingStorageState extends State<HarvestingStorage> {
  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=kWd_QnyO3eI');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harvesting and Storage", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
          child: ListView(
            children: [
              const Text(
                "Harvesting and Storage",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSection("Harvesting", [
                "There are several methods for harvesting, including hand harvesting and machine harvesting.",
                "- Hand harvesting: Uses tools like sickles, axes, and more to harvest crops like wheat, barley, pulses, and grass.",
                "- Machine harvesting: Uses a harvesting rig to clean and pack fruits and vegetables."
              ]),
              _buildSection("Storage", [
                "Improper storage can lead to crop destruction from pests or unfavorable environmental conditions. Here are some tips for storing crops:",
                "- Dry the grain: Before storing grain, make sure it's thoroughly dry.",
                "- Use bins and gunny bags: For home storage, use bins and gunny bags.",
                "- Use neem leaves: To protect grain from pests, put neem leaves in the bins and bags along with the grain.",
                "- Spray pesticides and insecticides: Before storing grain on a large scale, make sure the storage areas are free of pests and insects by spraying pesticides and insecticides."
              ]),
              _buildSection("Preparation for Harvesting", [
                "- Before harvesting, make sure you have enough labor, supplies, and that all equipment is working.",
                "- Harvest as soon as the crops are mature to maintain quality."
              ]),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _launchUrl,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
                child: const Text(
                  "Watch Video on Harvesting and Storage",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          ...details.map((detail) => Text(
            detail,
            style: const TextStyle(fontSize: 16),
          )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
