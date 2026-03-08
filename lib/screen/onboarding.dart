import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/verification_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "lib/assets/image/image1.png",
      "title": "All your favorites",
      "subtitle": " Get all your favorite foods in one place .\nYou just place the order, we do the rest"
    },
    {
      "image": "lib/assets/image/image2.png",
      "title": "Order from chosen chef",
      "subtitle": " Get all your favorite foods in one place .\nYou just place the order, we do the rest"
    },
    {
      "image": "lib/assets/image/image3.png",
      "title": "Free delivery offers",
      "subtitle": " Get all your favorite foods in one place .\nYou just place the order, we do the rest"
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(),
      ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          onboardingData[index]["image"]!,
                          height: 292,
                          width: 240,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sen",
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          onboardingData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                            fontFamily: "sen",
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (dotIndex) => _buildDot(dotIndex == _currentPage),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF7A00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == onboardingData.length - 1
                        ? "GET STARTED"
                        : "NEXT",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  // Skip action (go to main app/home screen)
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFF7A00) : Colors.orange.shade200,
        shape: BoxShape.circle,
      ),
    );
  }
}