import 'package:flutter/material.dart';

class AppColors {
  static Color primary = Colors.green;
  static Color secondary = Colors.orange;
  static Color textDark = Colors.brown[900]!;
  static Color textLight = Colors.green[900]!;
}

class AppTextStyles {
  static TextStyle titleLarge(
    BuildContext context, {
    bool isLargeScreen = false,
  }) {
    return TextStyle(
      fontFamily: "DancingScript",
      fontSize: isLargeScreen ? 32 : 24,
      color: AppColors.textLight,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText(
    BuildContext context, {
    bool isLargeScreen = false,
  }) {
    return TextStyle(
      fontSize: isLargeScreen ? 18 : 16,
      color: AppColors.textDark,
      fontWeight: FontWeight.bold,
    );
  }
}
