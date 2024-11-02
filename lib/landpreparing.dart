import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Landpreparing extends StatefulWidget {
  const Landpreparing({super.key});

  @override
  State<Landpreparing> createState() => _LandpreparingState();
}

class _LandpreparingState extends State<Landpreparing> {
  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=EsochGgRPmE&t=30s');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Land Preparation for Farming", style: TextStyle(color: Colors.white),),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Land preparation for farming involves several steps, including:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildStepTitle("Soil Preparation"),
                const Text(
                  "This includes loosening and digging the soil, also known as ploughing. Ploughing improves soil aeration, which helps roots penetrate the soil and allows plants to breathe.",
                ),
                const SizedBox(height: 12),
                _buildStepTitle("Leveling"),
                const Text(
                  "Leveling is an important step that helps to provide the soil with the right amount of moisture. It also reduces weed problems and irrigation time, and helps crops mature uniformly.",
                ),
                const SizedBox(height: 12),
                _buildStepTitle("Soil Testing"),
                const Text(
                  "Soil testing helps farmers understand the fertility and acidity level of their soil. This information can help farmers adjust the pH of the soil to ensure proper nutrient uptake and plant health.",
                ),
                const SizedBox(height: 12),
                _buildStepTitle("Weed Control"),
                const Text(
                  "Weed control is important in the early stages of plant growth. Plastic mulch can also be used to control weeds.",
                ),
                const SizedBox(height: 12),
                _buildStepTitle("Irrigation"),
                const Text(
                  "This is the artificial watering of land to promote plant growth.",
                ),
                const SizedBox(height: 12),
                _buildStepTitle("Cover Crops"),
                const Text(
                  "Planting cover crops can help keep soil in place, increase soil health, and reduce water runoff.",
                ),
                const SizedBox(height: 16),
                const Text(
                  "Preparing the soil is important for farming because it makes the land suitable for cultivation. Without proper soil preparation, the crop yield will be poor and the land will not develop properly.",
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700, // Set your desired color here
                  ),
                  child: const Text("Watch Video on Land Preparation", style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
