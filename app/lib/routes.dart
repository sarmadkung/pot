// lib/routes.dart
import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/track_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/createRestaurant/create_restaurant.dart'; // Import the RestaurantFormScreen

class Routes {
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';
  static const String restaurantFormRoute = '/restaurant_form';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => HomeScreen(),
    searchRoute: (context) => MapScreen(),
    settingsRoute: (context) => TrackScreen(),
    profileRoute: (context) => ProfileScreen(),
    restaurantFormRoute: (context) => RestaurantFormScreen(), // Add the route
  };
}
