import 'package:flutter/material.dart';
import 'chatbot_screen.dart'; // Import the ChatbotScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    ); // 3 tabs: Breakfast, Lunch, Dinner
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Breakfast'),
            Tab(text: 'Lunch'),
            Tab(text: 'Dinner'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Breakfast Tab
          _buildMealList(breakfastMeals),
          // Lunch Tab
          _buildMealList(lunchMeals),
          // Dinner Tab
          _buildMealList(dinnerMeals),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotScreen()),
          );
        },
        child: const Icon(Icons.chat),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _buildMealList(List<Map<String, dynamic>> meals) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealCard(
          image: meal['image'],
          name: meal['name'],
          price: meal['price'],
          rating: meal['rating'],
        );
      },
    );
  }
}

// Custom Widgets
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
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
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

// Mock Data
final List<Map<String, dynamic>> breakfastMeals = [
  {
    'image': 'assets/breakfast1.jpg',
    'name': 'Pancakes with Syrup',
    'price': 10000.0,
    'rating': 4.5,
  },
  {
    'image': 'assets/breakfast2.jpg',
    'name': 'Eggs and Bacon',
    'price': 12000.0,
    'rating': 4.2,
  },
];

final List<Map<String, dynamic>> lunchMeals = [
  {
    'image': 'assets/lunch1.jpg',
    'name': 'Grilled Chicken Salad',
    'price': 15000.0,
    'rating': 4.7,
  },
  {
    'image': 'assets/lunch2.jpg',
    'name': 'Beef Burger',
    'price': 18000.0,
    'rating': 4.4,
  },
];

final List<Map<String, dynamic>> dinnerMeals = [
  {
    'image': 'assets/dinner1.jpg',
    'name': 'Spaghetti Bolognese',
    'price': 20000.0,
    'rating': 4.6,
  },
  {
    'image': 'assets/dinner2.jpg',
    'name': 'Grilled Salmon',
    'price': 25000.0,
    'rating': 4.8,
  },
];
