import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Colors.black; // Purple
  static const Color primaryVariant = Colors.black45; // Darker Purple
  static const Color secondary = Colors.grey; // Teal
  static const Color secondaryVariant = Color(0xFF018786); // Darker Teal

  // Background and Surface
  static const Color background = Color(0xFFF5F5F5); // Light Grey
  static const Color surface = Color(0xFFFFFFFF); // White

  // Error
  static const Color error = Color(0xFFB00020); // Red

  // Text Colors
  static const Color onPrimary =
      Color(0xFFFFFFFF); // White for primary contrast
  static const Color onSecondary =
      Color(0xFF000000); // Black for secondary contrast
  static const Color onBackground = Color(0xFF000000); // Black on background
  static const Color onSurface = Color(0xFF000000); // Black on surface
  static const Color onError = Color(0xFFFFFFFF); // White on error

  // Custom Colors
  static const Color success = Color(0xFF4CAF50); // Green for success messages
  static const Color warning = Color(0xFFFFC107); // Amber for warnings
  static const Color info = Color(0xFF2196F3); // Blue for info messages

  // Grays for borders, dividers, etc.
  static const Color greyLight = Color(0xFFEEEEEE); // Light Grey
  static const Color greyMedium = Color(0xFFBDBDBD); // Medium Grey
  static const Color greyDark = Color(0xFF616161); // Dark Grey
}
