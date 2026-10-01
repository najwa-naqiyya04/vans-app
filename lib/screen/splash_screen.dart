import 'package:flutter/material.dart';
import 'package:hello_flutter/contollers/splash_animation_controller.dart';
import 'package:hello_flutter/screen/onboarding_screen.dart';

import '../theme/app_theme.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final SplashAnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = SplashAnimationController(
      vsync: this,
    );

    animationController.start();

    Future.delayed(
      const Duration(milliseconds: 3500),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: AnimatedBuilder(
        animation: animationController.controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // BACKGROUND
              Container(
                color: AppTheme.background,
              ),

              // BLOB
              Transform.scale(
                scale: animationController.blobScale.value,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      animationController.blobWidth.value,

                  height: MediaQuery.of(context).size.height *
                      animationController.blobHeight.value,

                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(180),
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(180),
                    ),
                  ),
                ),
              ),

              // CONTENT
              FadeTransition(
                opacity: animationController.contentFade,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'VANS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 5,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'OFF THE WALL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      'WELCOME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
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