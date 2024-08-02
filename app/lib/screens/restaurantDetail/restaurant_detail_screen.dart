// restaurant_detail_screen.dart
import 'package:flutter/material.dart';
import 'restaurant_detail_card.dart';
import '../../layouts/base_layout.dart';

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

class RestaurantDetailScreen extends StatefulWidget {
  final int restaurantId;
  final String restaurantTitle;

  const RestaurantDetailScreen({
    Key? key,
    required this.restaurantId,
    required this.restaurantTitle,
  }) : super(key: key);

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Popular Dishes',
      'dishes': [
        {
          'title': 'Pizza',
          'id': 1,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg'
        },
        {
          'title': 'Pasta',
          'id': 2,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/270346/pexels-photo-270346.jpeg'
        },
        {
          'title': 'Burger',
          'id': 3,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg'
        },
        {
          'title': 'Salad',
          'id': 4,
          'rating': 4.2,
          'image':
              'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg'
        },
      ]
    },
    {
      'title': 'Rice',
      'dishes': [
        {
          'title': 'Chicken Rice',
          'id': 5,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/4221804/pexels-photo-4221804.jpeg'
        },
        {
          'title': 'Fried Rice',
          'id': 6,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/324030/pexels-photo-324030.jpeg'
        },
        {
          'title': 'Rice with Veggies',
          'id': 7,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/4221804/pexels-photo-4221804.jpeg'
        },
      ]
    },
    {
      'title': 'Meat',
      'dishes': [
        {
          'title': 'Grilled Meat',
          'id': 8,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/396228/pexels-photo-396228.jpeg'
        },
        {
          'title': 'Steak',
          'id': 9,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/4221804/pexels-photo-4221804.jpeg'
        },
        {
          'title': 'Meatballs',
          'id': 10,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/459469/pexels-photo-459469.jpeg'
        },
      ]
    },
    {
      'title': 'Arabic',
      'dishes': [
        {
          'title': 'Shawarma',
          'id': 11,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/1259948/pexels-photo-1259948.jpeg'
        },
        {
          'title': 'Falafel',
          'id': 12,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/4221804/pexels-photo-4221804.jpeg'
        },
        {
          'title': 'Hummus',
          'id': 13,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/923182/pexels-photo-923182.jpeg'
        },
      ]
    },
    {
      'title': 'Chinese',
      'dishes': [
        {
          'title': 'Kung Pao Chicken',
          'id': 14,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/414494/pexels-photo-414494.jpeg'
        },
        {
          'title': 'Sweet and Sour Pork',
          'id': 15,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg'
        },
        {
          'title': 'Spring Rolls',
          'id': 16,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/270346/pexels-photo-270346.jpeg'
        },
      ]
    },
    {
      'title': 'Fast Food',
      'dishes': [
        {
          'title': 'Burger',
          'id': 17,
          'rating': 4.5,
          'image':
              'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg'
        },
        {
          'title': 'Pizza',
          'id': 18,
          'rating': 4.0,
          'image':
              'https://images.pexels.com/photos/4221804/pexels-photo-4221804.jpeg'
        },
        {
          'title': 'Fries',
          'id': 19,
          'rating': 3.5,
          'image':
              'https://images.pexels.com/photos/277253/pexels-photo-277253.jpeg'
        },
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
        ),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFfafcfa), // Very light greenish-white
                Color(0xFFf7fff7), // Light greenish-white
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero, // Remove default padding
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          // Handle back button press
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 40.0), // Adjust as needed
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                ...categories.map((category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: category['dishes'].map<Widget>((dish) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: RestaurantDetailCard(
                                imageUrl: dish['image'],
                                title: dish['title'],
                                rating: dish['rating'],
                                id: dish['id'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
