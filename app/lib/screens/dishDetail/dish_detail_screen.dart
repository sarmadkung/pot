// lib/screens/dish_details_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import '../../providers/restaurant_provider.dart'; // Import your provider
import '../../routes.dart'; // Import the routes

class DishDetailsScreen extends StatelessWidget {
  final int dishId;
  final String dishName;
  final double rating = 0.0;
  final double price = 0;
  final String imageUrl = 'https://images.pexels.com/photos/396228/pexels-photo-396228.jpeg';

  const DishDetailsScreen({
    Key? key,
    required this.dishId,
    required this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    // Placeholder data for popular dishes and categories
    List<String> ingredrents = ['rice', 'oil', 'green-chili', 'Salad'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // Adjust the height as per your design
        child: AppBar(
          automaticallyImplyLeading: false, // Remove the default back button
          flexibleSpace: Container(
            width: double.infinity,
            height: 100, // Adjust the height as per your design
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/logo.jpeg', // Replace with your logo asset path
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 8.0, // Adjust the padding as per your design
                  top: 50.0, // Adjust the top padding to move it down
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        dishName,
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            rating.toString(),
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.4, // 40% of the screen height
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add to order action with animation
                          final snackBar = SnackBar(
                            content: Text('$dishName added to order'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Green background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Add to Order',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: ingredrents.map((dish) {
                      return Chip(
                        label: Text(dish),
                        backgroundColor: Colors.grey[300],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.restaurantFormRoute);
                    },
                    child: Text('Create Restaurant'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
