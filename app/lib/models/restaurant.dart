// lib/models/restaurant.dart
import 'package:image_picker/image_picker.dart';

class Restaurant {
  String name;
  String location;
  String owner;
  int employees;
  List<XFile> images;

  Restaurant({
    required this.name,
    required this.location,
    required this.owner,
    required this.employees,
    required this.images,
  });
}
