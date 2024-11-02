import 'db_helper.dart';
import 'model.dart';
import 'package:flutter/material.dart';

class NGOsAndSchemesPage extends StatefulWidget {
  const NGOsAndSchemesPage({Key? key}) : super(key: key);

  @override
  State<NGOsAndSchemesPage> createState() => _NGOsAndSchemesPageState();
}

class _NGOsAndSchemesPageState extends State<NGOsAndSchemesPage> {
  Future<List<NGO>> _getRegisteredNGOs() async {
    return await DatabaseHelper().getNGOs();
  }

  Future<void> _deleteNGO(int id) async {
    await DatabaseHelper().deleteNGO(id);
    setState(() {}); // Refresh the UI after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NGOs & Government Schemes",style: TextStyle(color: Colors.white),),
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
        child: FutureBuilder<List<NGO>>(
          future: _getRegisteredNGOs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No NGOs registered yet."));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final ngo = snapshot.data![index];
                  return ListTile(
                    title: Text(ngo.name),
                    subtitle: Text(ngo.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, ngo.id!);
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this NGO?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await _deleteNGO(id); // Delete the NGO and refresh the list
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}