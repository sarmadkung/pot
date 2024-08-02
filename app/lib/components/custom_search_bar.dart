import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const CustomSearchBar({
    Key? key,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey[300]), // Light grey placeholder
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0), // 50% border radius
            borderSide: BorderSide(color: unselectedItemColor), // Border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0), // 50% border radius
            borderSide: BorderSide(color: unselectedItemColor), // Border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0), // 50% border radius
            borderSide: BorderSide(color: selectedItemColor), // Border color when focused
          ),
          filled: true, // Fill the background
          fillColor: Colors.grey[100], // Light grey background
          prefixIcon: Icon(Icons.search, color: unselectedItemColor), // Icon color
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add some padding
        ),
      ),
    );
  }
}