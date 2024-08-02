import 'package:flutter/material.dart';
import '../../components/custom_search_bar.dart';
import './restaurant_card.dart';
import '../restaurantDetail/restaurant_detail_screen.dart';
import '../restaurants/restaurants_screen.dart';

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

class HomeScreen extends StatelessWidget {
  final List<Restaurant> popularRestaurants = [
    Restaurant(imageUrl: 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg', title: 'Restaurant 1', id: 1, rating: 4.5),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg', title: 'Restaurant 2', id: 2, rating: 3.8),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', title: 'Restaurant 3', id: 3, rating: 4.0),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/1058277/pexels-photo-1058277.jpeg', title: 'Restaurant 4', id: 4, rating: 4.2),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/305236/pexels-photo-305236.jpeg', title: 'Restaurant 5', id: 5, rating: 4.7),
  ];

  final List<Restaurant> nearMeRestaurants = [
    Restaurant(imageUrl: 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', title: ' Restaurant 1', id: 11, rating: 3.9),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg', title: ' Restaurant 2', id: 12, rating: 4.1),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg', title: ' Restaurant 3', id: 13, rating: 4.3),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', title: ' Restaurant 4', id: 14, rating: 3.5),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/1058277/pexels-photo-1058277.jpeg', title: ' Restaurant 5', id: 15, rating: 4.6),
  ];

  final List<Restaurant> suggestedRestaurants = [
    Restaurant(imageUrl: 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg', title: 'Restaurant 1', id: 21, rating: 4.3),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', title: 'Restaurant 2', id: 22, rating: 4.4),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg', title: 'Restaurant 3', id: 23, rating: 4.1),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg', title: 'Restaurant 4', id: 24, rating: 3.9),
    Restaurant(imageUrl: 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', title: 'Restaurant 5', id: 25, rating: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF8F8F8),
          padding: EdgeInsets.symmetric(vertical: 8.0), // Reduced vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(
                selectedItemColor: Color.fromARGB(255, 2, 165, 43),
                unselectedItemColor: Colors.black54,
              ),
              SizedBox(height: 8),
              buildRestaurantSection(
                context,
                'Popular Restaurants',
                popularRestaurants,
              ),
              SizedBox(height: 16),
              buildRestaurantSection(
                context,
                'Near Me Restaurants',
                nearMeRestaurants,
              ),
              SizedBox(height: 16),
              buildRestaurantSection(
                context,
                'Suggested for you',
                suggestedRestaurants,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRestaurantSection(BuildContext context, String title, List<Restaurant> restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0), // Updated padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllRestaurantsScreen(),
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(color: Color.fromARGB(255, 49, 180, 1)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8), // Reduced height
        Container(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0, right: 8.0),
                child: RestaurantCard(
                  imageUrl: restaurant.imageUrl,
                  title: restaurant.title,
                  id: restaurant.id,
                  rating: restaurant.rating,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
