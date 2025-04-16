import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryRed = Color(0xFFE91E63);
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color primaryYellow = Color(0xFFFFC107);
  static const Color primaryPurple = Color(0xFF9C27B0);
  static const Color primaryOrange = Color(0xFFFF9800);

  // Category Colors
  static const List<Color> categoryColors = [
    primaryBlue,
    primaryRed,
    primaryGreen,
    primaryYellow,
    primaryPurple,
    primaryOrange,
  ];

  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );

  // Card Styles
  static const double cardBorderRadius = 20.0;
  static const double cardElevation = 8.0;
  static const double cardPadding = 16.0;

  // Icon Sizes
  static const double largeIconSize = 64.0;
  static const double mediumIconSize = 48.0;
  static const double smallIconSize = 32.0;

  // Animation Durations
  static const Duration quickAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Layout Constants
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultBorderRadius = 12.0;

  // Responsive Breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
} 