import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CampusBite 🍔'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants or meals...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryButton(
                    icon: Icons.breakfast_dining,
                    label: 'Breakfast',
                  ),
                  CategoryButton(icon: Icons.lunch_dining, label: 'Lunch'),
                  CategoryButton(icon: Icons.dinner_dining, label: 'Dinner'),
                ],
              ),
            ),
            // Featured Restaurants
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Restaurants',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Restaurant List
            RestaurantCard(name: 'Burger Palace', rating: 4.5),
            RestaurantCard(name: 'Pizza Haven', rating: 4.7),
            RestaurantCard(name: 'Healthy Bites', rating: 4.2),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.orange),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final double rating;

  const RestaurantCard({Key? key, required this.name, required this.rating})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.restaurant, size: 40, color: Colors.orange),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Rating: $rating'),
        onTap: () {
          // Navigate to the restaurant's menu
        },
      ),
    );
  }
}
