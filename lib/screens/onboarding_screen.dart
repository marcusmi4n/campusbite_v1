import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key); // Added key parameter

  @override
  OnboardingScreenState createState() => OnboardingScreenState(); // Removed underscore to make it public
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'type': 'image',
      'asset': 'assets/logo.png',
      'title': 'Welcome to CampusBite! 🍔',
      'description':
          'Your go-to app for affordable healthy & delicious meals on campus.',
    },
    {
      'type': 'animation',
      'asset': 'assets/animations/phone_food.json',
      'title': 'Easy Ordering 🚀',
      'description':
          'Browse menus, place orders, and enjoy quick delivery right to your lecture room.',
    },
    {
      'type': 'animation',
      'asset': 'assets/animations/student_eating.json',
      'title': 'Get Started 🍕',
      'description': 'Join CampusBite today and never miss a meal again!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                type: onboardingData[index]['type'],
                asset: onboardingData[index]['asset'],
                title: onboardingData[index]['title'],
                description: onboardingData[index]['description'],
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: WormEffect(
                    activeDotColor: const Color.fromARGB(255, 213, 113, 4),
                    dotColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                _currentPage == onboardingData.length - 1
                    ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor:
                            Colors
                                .orange, // Replaced primary with backgroundColor
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Get Started'), // Moved child to the end
                    )
                    : ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor:
                            Colors
                                .orange, // Replaced primary with backgroundColor
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Next'), // Moved child to the end
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String type;
  final String asset;
  final String title;
  final String description;

  const OnboardingPage({
    // Added const constructor
    Key? key, // Added key parameter
    required this.type,
    required this.asset,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20), // Added const
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (type == 'image')
            Image.asset(asset, height: 300)
          else if (type == 'animation')
            Lottie.asset(asset, height: 300),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
