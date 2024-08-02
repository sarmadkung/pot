import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take full width of the screen
      child: Image.asset(
        'assets/logo.jpeg', // Update with your logo path
        fit: BoxFit.cover, // Ensure the logo fills the container
        height: 100, // Adjust height as needed
      ),
    );
  }
}
