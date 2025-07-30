import 'package:architecture_template/product/init/theme/custom_color_scheme.dart';
import 'package:architecture_template/product/init/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: CustomColorScheme.lightScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: CustomColorScheme.darkScheme.outline,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(
        color: CustomColorScheme.darkScheme.outline,
      ),
    ),
  );
  @override
  final TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(
      color: CustomColorScheme.darkScheme.onSurface,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  );
}
