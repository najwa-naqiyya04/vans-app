import 'package:flutter/material.dart';
import 'package:hello_flutter/contollers/onboarding_controller.dart';

import '../data/onboarding_data.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingController controller;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = OnboardingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < onboardingPages.length - 1) {
      controller.nextPage();
    } else {
      goToLogin();
    }
  }

  void skipOnboarding() {
    goToLogin();
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              // ONBOARDING PAGES
              PageView.builder(
                controller: controller.pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    data: onboardingPages[index],
                    onButtonPressed: nextPage,
                  );
                },
              ),

              // LOGO
              const Positioned(
                top: 22,
                left: 24,
                child: Text(
                  'VANS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              ),

              // SKIP
              Positioned(
                top: 10,
                right: 10,
                child: TextButton(
                  onPressed: skipOnboarding,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              // INDICATOR
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: OnboardingIndicator(
                  currentPage: currentPage,
                  pageCount: onboardingPages.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}