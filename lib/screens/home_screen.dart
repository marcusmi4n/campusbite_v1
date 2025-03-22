import 'package:flutter/material.dart';
import 'chatbot_screen.dart'; // Import the ChatbotScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusBite 🍔'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notifications Screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to Profile Screen
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
                children: const [
                  CategoryButton(
                    icon: Icons.breakfast_dining,
                    label: 'Breakfast',
                  ),
                  CategoryButton(icon: Icons.lunch_dining, label: 'Lunch'),
                  CategoryButton(icon: Icons.dinner_dining, label: 'Dinner'),
                ],
              ),
            ),

            // Featured Meals
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Popular Meals',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    featuredMeals.map((meal) {
                      return MealCard(
                        image: meal['image'],
                        name: meal['name'],
                        price: meal['price'],
                        rating: meal['rating'],
                      );
                    }).toList(),
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
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    aiSuggestions.map((suggestion) {
                      return SuggestionCard(text: suggestion['text']);
                    }).toList(),
              ),
            ),

            // Quick Links
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  QuickLinkButton(icon: Icons.shopping_cart, label: 'Cart'),
                  QuickLinkButton(icon: Icons.history, label: 'Orders'),
                  QuickLinkButton(icon: Icons.chat, label: 'Chatbot'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

// Custom Widgets
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
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;

  const MealCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.asset(image, width: 150, height: 120, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'UGX ${price.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionCard extends StatelessWidget {
  final String text;

  const SuggestionCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 16))),
      ),
    );
  }
}

class QuickLinkButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickLinkButton({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40, color: Colors.orange),
          onPressed: () {
            // Navigate to respective screen
            if (label == 'Chatbot') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatbotScreen()),
              );
            }
          },
        ),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

// Mock Data
final List<Map<String, dynamic>> featuredMeals = [
  {
    'image': 'assets/burger.jpg',
    'name': 'Burger & Fries',
    'price': 15000,
    'rating': 4.5,
  },
  {
    'image': 'assets/pizza.jpg',
    'name': 'Pizza Margherita',
    'price': 20000,
    'rating': 4.2,
  },
  {
    'image': 'assets/salad.jpg',
    'name': 'Vegetable Salad',
    'price': 10000,
    'rating': 4.7,
  },
];

final List<Map<String, dynamic>> aiSuggestions = [
  {'text': 'Having a tough day? Try our comfort food specials!'},
  {'text': 'You might also like...'},
];
