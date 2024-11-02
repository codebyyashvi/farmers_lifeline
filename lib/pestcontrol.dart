import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PestControl extends StatefulWidget {
  const PestControl({super.key});

  @override
  State<PestControl> createState() => _PestControlState();
}

class _PestControlState extends State<PestControl> {
  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=_1BdRzoN-50');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pest Control", style: TextStyle(color: Colors.white),),
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
                "There are several ways to control pests in farming, including:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildControlMethod("Cultural Control", [
                "Change the environment to make it less hospitable for pests. This can include:",
                "- Rotating crops: Disrupts the life cycle of pests",
                "- Removing weeds: Reduces places for pests to hide and breed",
                "- Planting pest-resistant crops: Reduces damage caused by pests"
              ]),
              _buildControlMethod("Biological Control", [
                "Introduce, increase, or maintain populations of natural enemies to the pest. This can include:",
                "- Beneficial insects and mites: Ladybugs, lacewings, and parasitic wasps can control aphids, while predatory mites can help with spider mites",
                "- Habitat manipulation: Create a favorable habitat for beneficial organisms by planting insectary strips or cover crops"
              ]),
              _buildControlMethod("Biopesticides", [
                "Use naturally derived substances, such as microbial agents and botanical extracts, that have pesticidal properties."
              ]),
              _buildControlMethod("Chemical Control", [
                "Use synthetic substances to exterminate or deter pests. Pesticides can be effective, but they can also be harmful to the environment and to human health."
              ]),
              _buildControlMethod("Sanitation", [
                "Remove pests or their sources of food and shelter. This can include:",
                "- Using pest-free seeds or transplants",
                "- Decontaminating equipment, animals, and other possible carriers"
              ]),
              _buildControlMethod("Mechanical Controls", [
                "Use trapping when pests become a more serious problem."
              ]),
              _buildControlMethod("Conservation", [
                "Preserve and release natural enemies by environmental manipulations or alter production practices."
              ]),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _launchUrl,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
                child: const Text(
                  "Watch Video on Pest Control",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlMethod(String title, List<String> details) {
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
