import 'package:flutter/material.dart';
import '../dishDetail/dish_detail_screen.dart'; // Import DetailDishScreen

class RestaurantDetailCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int id;
  final String defaultImageUrl = 'https://images.pexels.com/photos/3764642/pexels-photo-3764642.jpeg'; // Default Pexels image URL

  const RestaurantDetailCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail screen with dish details
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DishDetailsScreen(
               dishId: id,
               dishName: title
            ),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
         color: Color(0xFFf7fff7), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Display default image from Pexels if imageUrl is invalid or empty
                            return Image.network(
                              defaultImageUrl,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.network(
                          defaultImageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Rating: $rating',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
