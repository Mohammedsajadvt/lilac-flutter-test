import 'package:flutter/material.dart';
import 'package:fluttertest/core/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": "assets/images/f1.jpg",
      "title": "Catch Every Blockbuster Without the Queue",
      "gradientColor": const Color(0xFF9C9F8E), 
    },
    {
      "image": "assets/images/superman.png",
      "title": "Because Movies Deserve More Than Queues",
      "gradientColor": const Color(0xFF26539E),
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = onboardingData[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                page['image']!,
                fit: BoxFit.cover,
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      page['gradientColor'] as Color,
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      page['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: _currentPage == onboardingData.length - 1
                          ? "GET STARTED"
                          : "NEXT",
                      onPressed: _nextPage,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
