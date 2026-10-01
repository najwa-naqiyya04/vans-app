import 'package:flutter/material.dart';
import 'package:hello_flutter/screen/splash_screen.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const VansApp());
}

class VansApp extends StatelessWidget {
  const VansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vans',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}