import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // Dummy data
  final String? profileImageUrl = null; // Replace with actual URL or leave as null for initials
  final String firstName = 'John';
  final String lastName = 'Doe';
  final int age = 25;
  final String mobile = '123-456-7890';
  final String email = 'john.doe@example.com';

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50], // Set background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(profileImageUrl!)
                    : null,
                child: profileImageUrl == null
                    ? Text(
                        '${firstName[0]}${lastName[0]}',
                        style: TextStyle(fontSize: 40),
                      )
                    : null,
              ),
              SizedBox(height: 16),

              // First Name
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Border color when active
                  ),
                ),
                controller: TextEditingController(text: firstName),
              ),
              SizedBox(height: 16),

              // Last Name
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Border color when active
                  ),
                ),
                controller: TextEditingController(text: lastName),
              ),
              SizedBox(height: 16),

              // Age
              TextField(
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Border color when active
                  ),
                ),
                controller: TextEditingController(text: age.toString()),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Mobile
              TextField(
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Border color when active
                  ),
                ),
                controller: TextEditingController(text: mobile),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),

              // Email
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Border color when active
                  ),
                ),
                controller: TextEditingController(text: email),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                  final snackBar = SnackBar(content: Text('Profile saved'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set button color
                ),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
