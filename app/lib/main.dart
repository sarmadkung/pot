// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/restaurant_provider.dart'; // Import your provider
import 'screens/home/home_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/track_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/restaurants/restaurants_screen.dart';
import 'screens/createRestaurant/create_restaurant.dart';
import 'bottom_navigation_bar.dart';
import 'components/logo.dart';
import 'routes.dart'; // Import the routes file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RestaurantProvider()),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        home: BottomNavigationBarExample(),
        routes: Routes.routes, // Use the routes from Routes class
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MapScreen(),
    TrackScreen(),
    ProfileScreen(),
    AllRestaurantsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100, // Adjust height as needed
            child: Center(
              child: Logo(), // Use the Logo component here
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _widgetOptions,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
