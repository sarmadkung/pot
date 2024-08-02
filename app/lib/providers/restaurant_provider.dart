// lib/providers/restaurant_provider.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  Restaurant _restaurant = Restaurant(
    name: '',
    location: '',
    owner: '',
    employees: 0,
    images: [],
  );

  Restaurant get restaurant => _restaurant;

  void updateName(String name) {
    _restaurant.name = name;
    notifyListeners();
  }

  void updateLocation(String location) {
    _restaurant.location = location;
    notifyListeners();
  }

  void updateOwner(String owner) {
    _restaurant.owner = owner;
    notifyListeners();
  }

  void updateEmployees(int employees) {
    _restaurant.employees = employees;
    notifyListeners();
  }

  void addImage(XFile image) {
    _restaurant.images.add(image);
    notifyListeners();
  }

  void removeImage(XFile image) {
    _restaurant.images.remove(image);
    notifyListeners();
  }
}
