import 'package:flutter/material.dart';
import 'chatbot_screen.dart'; // Import the ChatbotScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Use super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusBite 🍔'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Chatbot Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotScreen()),
          );
        },
        child: const Icon(Icons.chat),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for meals...',
                  prefixIcon: const Icon(Icons.search),
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
            // AI Suggestions
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'AI Suggestions for You',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Suggested Meals
            MealCard(name: 'Burger & Fries', price: 15000),
            MealCard(name: 'Pizza Margherita', price: 20000),
            MealCard(name: 'Vegetable Salad', price: 10000),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
  }); // Use super.key

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.orange),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  final String name;
  final double price;

  const MealCard({
    super.key,
    required this.name,
    required this.price,
  }); // Use super.key

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.fastfood, size: 40, color: Colors.orange),
        title: Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('UGX ${price.toStringAsFixed(0)}'),
        onTap: () {
          // Navigate to the meal details screen
        },
      ),
    );
  }
}
