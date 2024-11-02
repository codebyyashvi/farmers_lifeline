import 'package:farmers_lifeline/model.dart';
import 'package:farmers_lifeline/ngos.dart';
import 'package:flutter/material.dart';
import 'package:farmers_lifeline/db_helper.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _registeredUsers = []; // Temporary in-memory storage

  final TextEditingController _orgNameController = TextEditingController();
  final TextEditingController _contactPersonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final ngo = NGO(_orgNameController.text, _addressController.text);

      await DatabaseHelper().insertNGO(ngo);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration submitted!")),
      );

      _orgNameController.clear();
      _contactPersonController.clear();
      _emailController.clear();
      _phoneController.clear();
      _addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NGO Registration", style: TextStyle(color: Colors.white),),
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                _buildTextField("Organization Name", Icons.business, "Enter organization name", _orgNameController),
                const SizedBox(height: 20),
                _buildTextField("Contact Person", Icons.person, "Enter contact person’s name", _contactPersonController),
                const SizedBox(height: 20),
                _buildTextField("Email", Icons.email, "Enter email", _emailController, isEmail: true),
                const SizedBox(height: 20),
                _buildTextField("Phone Number", Icons.phone, "Enter phone number", _phoneController, isNumber: true),
                const SizedBox(height: 20),
                _buildTextField("Address", Icons.location_on, "Enter address", _addressController, isMultiline: true),
                const SizedBox(height: 40),

                // Submit button
                ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Submit Registration",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                // Login prompt
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NGOsAndSchemesPage()),
                    );
                  },
                  child: const Text(
                    "If already registered, then click here to see",
                    style: TextStyle(color: Colors.blue, fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, String hintText, TextEditingController controller, {bool isEmail = false, bool isNumber = false, bool isMultiline = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isNumber
          ? TextInputType.phone
          : isMultiline
          ? TextInputType.multiline
          : TextInputType.text,
      maxLines: isMultiline ? 3 : 1,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required";
        }
        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Enter a valid email";
        }
        if (isNumber && !RegExp(r'^\d+$').hasMatch(value)) {
          return "Enter a valid phone number";
        }
        if(isNumber && value.length!=10){
          return "Enter a valid phone number";
        }
        return null;
      },
    );
  }
}