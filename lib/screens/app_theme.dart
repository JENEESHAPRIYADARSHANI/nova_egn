import 'package:flutter/material.dart';

class AppTheme {
  // Gradient background colors from your splash design
  static const Color topGradient = Color(0xFF0B2E73); // dark navy blue
  static const Color bottomGradient = Color(0xFF2A5EB3); // lighter blue

  static const _brandSeed = Color(0xFF1463F3);

  // Light theme
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _brandSeed),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white70,
          ),
        ),
      );

  // Dark theme
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: _brandSeed, brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white70,
          ),
        ),
      );

  // Gradient background for splash & onboarding screens
  static BoxDecoration get gradientBackground => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [topGradient, bottomGradient],
        ),
      );
}
