import 'package:architecture_template/product/init/theme/custom_color_scheme.dart';
import 'package:architecture_template/product/init/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkScheme,
        // Euclid kullanılmış ama ona en yakın font olarak Manrope kullanmayı tercih ettim.
        // Euclid fontu lisanslı bir font olduğu için kullanamadım.
        fontFamily: GoogleFonts.manrope().fontFamily,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        textTheme: textTheme,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
  @override
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: CustomColorScheme.darkScheme.outline,
    labelStyle: TextStyle(
      color: CustomColorScheme.darkScheme.outlineVariant,
    ),
    hintStyle: TextStyle(
      color: CustomColorScheme.darkScheme.outlineVariant,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: CustomColorScheme.darkScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: CustomColorScheme.darkScheme.outline,
      ),
    ),
    prefixIconConstraints: const BoxConstraints(
      minWidth: 24,
      minHeight: 24,
      maxHeight: 70,
      maxWidth: 70,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: CustomColorScheme.darkScheme.outline,
      ),
    ),
  );
  @override
  final TextTheme textTheme = TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      titleSmall: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
      headlineMedium: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      bodySmall: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
      ),
      bodyMedium: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      // Premium offer sheet specific styles
      displayLarge: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 14.sp,
      ),
      displayMedium: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 24.sp,
        fontWeight: FontWeight.w900,
      ),
      labelLarge: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: CustomColorScheme.darkScheme.onSurface,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ));
}
