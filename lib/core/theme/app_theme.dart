import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: "Poppins", // ganti sesuai font
      primaryColor: AppColors.primary600,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.dark),
        titleTextStyle: TextStyle(
          color: AppColors.dark,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.grey600, fontSize: 12),
        bodyLarge: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w400),
        titleMedium: TextStyle(color: AppColors.dark, fontSize: 16, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: AppColors.dark, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary600,
        secondary: AppColors.primary500,
        error: AppColors.red500,
        surface: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary600,
          foregroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
      ),
    );
  }
}
