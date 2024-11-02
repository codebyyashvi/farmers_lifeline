import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmersProblem extends StatefulWidget {
  const FarmersProblem({super.key});

  @override
  State<FarmersProblem> createState() => _FarmersProblemState();
}

class _FarmersProblemState extends State<FarmersProblem> {
  final List<String> _problems = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProblems();
  }

  // Load problems from shared preferences
  Future<void> _loadProblems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedProblems = prefs.getStringList('problems');
    if (savedProblems != null) {
      setState(() {
        _problems.addAll(savedProblems);
      });
    }
  }

  // Save problems to shared preferences
  Future<void> _saveProblems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('problems', _problems);
  }

  // Method to add a new problem
  void _addProblem() {
    final problemText = _controller.text.trim();
    if (problemText.isNotEmpty) {
      setState(() {
        _problems.add(problemText);
        _controller.clear();
      });
      _saveProblems();
    }
  }

  // Method to delete a problem
  void _deleteProblem(int index) {
    setState(() {
      _problems.removeAt(index);
    });
    _saveProblems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer's Problems", style: TextStyle(color: Colors.white),),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Describe the problem",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _addProblem,
                  ),
                ),
                maxLines: 3,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _problems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        _problems[index],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () => _deleteProblem(index),  // Call delete method
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
