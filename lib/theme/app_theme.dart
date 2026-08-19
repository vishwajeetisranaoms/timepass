import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF131314);
  static const Color surface = Color(0xFF131314);
  static const Color surfaceContainerLowest = Color(0xFF0E0E0F);
  static const Color surfaceContainerLow = Color(0xFF1C1B1C);
  static const Color surfaceContainer = Color(0xFF201F20);
  static const Color surfaceContainerHigh = Color(0xFF2A2A2B);
  static const Color surfaceContainerHighest = Color(0xFF353436);

  static const Color primary = Color(0xFFDBFCFF);
  static const Color primaryFixedDim = Color(0xFF00DBE9);
  static const Color primaryContainer = Color(0xFF00F0FF);

  static const Color secondary = Color(0xFFFFB1C4);
  static const Color secondaryContainer = Color(0xFFFF4A8D);
  static const Color secondaryFixedDim = Color(0xFFFFB1C4);

  static const Color tertiaryFixed = Color(0xFFF5E700);
  static const Color tertiaryFixedDim = Color(0xFFD7CA00);

  static const Color onSurface = Color(0xFFE5E2E3);
  static const Color onSurfaceVariant = Color(0xFFB9CACB);
  static const Color outlineVariant = Color(0xFF3B494B);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF00F0FF), Color(0xFFFF4A8D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient xpGradient = LinearGradient(
    colors: [Color(0xFF00DBE9), Color(0xFF7DF4FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.primaryFixedDim,
        secondary: AppColors.secondaryContainer,
        tertiary: AppColors.tertiaryFixed,
        onSurface: AppColors.onSurface,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          height: 1.1,
          letterSpacing: -0.04,
          color: AppColors.onSurface,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.02,
          color: AppColors.onSurface,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.4,
          letterSpacing: -0.01,
          color: AppColors.onSurface,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: AppColors.onSurface,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.6,
          color: AppColors.onSurfaceVariant,
        ),
        labelLarge: GoogleFonts.spaceGrotesk(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: AppColors.primaryFixedDim,
        ),
      ),
    );
  }
}
