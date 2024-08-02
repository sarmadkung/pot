// all_restaurants_screen.dart
import 'package:flutter/material.dart';
import '../home/restaurant_card.dart'; // Make sure to update the import statement
import '../../bottom_navigation_bar.dart'; // Import the bottom navigation bar
import '../../components/logo.dart'; // Import the Logo component

class Restaurant {
  final String imageUrl;
  final String title;
  final int id;
  final double rating;

  Restaurant({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.rating,
  });
}

class AllRestaurantsScreen extends StatelessWidget {
  final List<Restaurant> restaurants = List.generate(
    10,
    (index) => Restaurant(
      imageUrl:
          'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
      title: 'Restaurant ${index + 1}',
      id: index + 1,
      rating: 1.1,
    ),
  );

  AllRestaurantsScreen({Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to HomeScreen or any other screen
        break;
      case 1:
        // Navigate to MapScreen or any other screen
        break;
      case 2:
        // Navigate to TrackScreen or any other screen
        break;
      case 3:
        // Navigate to ProfileScreen or any other screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF8F8F8), // Off-white background color
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start (left)
            children: [
              Logo(), // Add the Logo component here
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 16.0), // Add horizontal and vertical padding
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Handle back button press
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'All Restaurants',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two cards per row
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return RestaurantCard(
                      imageUrl: restaurant.imageUrl,
                      title: restaurant.title,
                      id: restaurant.id,
                      rating: restaurant.rating,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0, // Adjust as necessary
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
