import 'package:farmers_lifeline/harvestingstorage.dart';
import 'package:farmers_lifeline/pestcontrol.dart';
import 'package:farmers_lifeline/watering.dart';
import 'package:flutter/material.dart';
import 'package:farmers_lifeline/landpreparing.dart';

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Farming", style: TextStyle(color: Colors.white),),
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  "Welcome to Farming",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  "Learn step-by-step techniques to become a successful farmer. Here’s what we’ll cover:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.grass, color: Colors.green),
                    title: Text("Preparing the Land"),
                    subtitle: Text("Learn how to prepare soil for maximum yield."),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Landpreparing()),
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.water, color: Colors.blue),
                  title: Text("Watering Techniques"),
                  subtitle: Text("Efficient water management for crops."),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WateringTechniques()),
                    );// Navigate to detailed learning page about watering techniques
                  },
                ),
                ListTile(
                  leading: Icon(Icons.pest_control, color: Colors.brown),
                  title: Text("Pest Control"),
                  subtitle: Text("Organic ways to protect crops from pests."),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PestControl()),
                    );// Navigate to detailed learning page about pest control
                  },
                ),
                ListTile(
                  leading: Icon(Icons.agriculture, color: Colors.orange),
                  title: Text("Harvesting and Storage"),
                  subtitle: Text("Best practices for harvesting and storing crops."),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HarvestingStorage()),
                    );// Navigate to detailed learning page about harvesting and storage
                  },
                ),
                SizedBox(height: 30),
                Text(
                  "Stay tuned for more updates!",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
