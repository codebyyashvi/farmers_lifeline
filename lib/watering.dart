import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WateringTechniques extends StatefulWidget {
  const WateringTechniques({super.key});

  @override
  State<WateringTechniques> createState() => _WateringTechniquesState();
}

class _WateringTechniquesState extends State<WateringTechniques> {
  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=Blb0_8ZcMwc');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watering Techniques", style: TextStyle(color: Colors.white),),
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
                "Here are some watering techniques to learn for farming:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTechnique("Drip Irrigation",
                  "A water-efficient technique that slowly drips water at the base of plants, preventing overwatering and run-off."),
              _buildTechnique("Irrigation Scheduling",
                  "A system that advises on how much water is needed, and when and how to water. This can help inexperienced farmers improve productivity while reducing water consumption."),
              _buildTechnique("Rainwater Harvesting",
                  "A sustainable source of water for irrigation, especially in arid and semi-arid regions."),
              _buildTechnique("Sprinkler Irrigation",
                  "An efficient technique for seasonal crops that can save up to 75% of water."),
              _buildTechnique("Micro Irrigation",
                  "A modern method that uses drippers, sprinklers, and other emitters to water crops. This technique can improve crop yield and soil health."),
              _buildTechnique("Pivot Irrigation",
                  "An AI-based system that uses in-field sensors to adjust the angle and stream of water flow. This helps reach plants that are far from the water source."),
              const SizedBox(height: 24),
              const Text(
                "Before setting up an irrigation system, farmers should consider several factors, including:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildConsiderations(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _launchUrl,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
                child: const Text(
                  "Watch Video on Watering Techniques",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechnique(String title, String description) {
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
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildConsiderations() {
    const considerations = [
      "Soil properties, such as type, drainage, and water holding capacity",
      "Water quality, availability, and quantity",
      "Crop properties, such as yield potential, frost resistance, and rooting depth",
      "Climate requirements, such as humidity, temperature, and precipitation",
      "Farmer capabilities, such as farm labor, financial health, and management skills",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: considerations
          .map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text("• $item", style: const TextStyle(fontSize: 16)),
      ))
          .toList(),
    );
  }
}
