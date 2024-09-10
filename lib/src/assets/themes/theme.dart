import 'package:flutter/material.dart';

import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/themes/theme_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: whiteSmoke,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          shadowColor: white,
          surfaceTintColor: white,
          centerTitle: true,
          elevation: 1,
        ),
        colorSchemeSeed: mainBlue,
        dividerTheme: const DividerThemeData(color: Color(0xFFEAEEF2)),
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.light],
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
        // Set the default text color to black for the light theme
        textTheme: ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(color: Colors.black),
              displayMedium: const TextStyle(color: Colors.black),
              displaySmall: const TextStyle(color: Colors.black),
              headlineLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              headlineSmall: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),
              titleSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              bodyMedium: const TextStyle(color: Colors.black),
              bodySmall: const TextStyle(color: Colors.black),
              labelLarge: const TextStyle(color: Colors.black),
              labelMedium: const TextStyle(color: Colors.black),
              labelSmall: const TextStyle(color: Colors.black),
            ),
      );

  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1F242F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B26),
          shadowColor: Color(0xFF161B26),
          surfaceTintColor: Color(0xFF161B26),
          centerTitle: true,
          foregroundColor: white,
          elevation: 1,
        ),
        dividerTheme: const DividerThemeData(color: Color(0xFF161B26)),
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.dark],
        colorSchemeSeed: mainBlue,
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        // Set the default text color to black for the light theme
        textTheme: ThemeData.dark().textTheme.copyWith(
              displayLarge: const TextStyle(color: Colors.white),
              displayMedium: const TextStyle(color: Colors.white),
              displaySmall: const TextStyle(color: Colors.white),
              headlineLarge: const TextStyle(color: Colors.white),
              headlineMedium: const TextStyle(color: Colors.white),
              headlineSmall: const TextStyle(color: Colors.white),
              titleLarge: const TextStyle(color: Colors.white),
              titleMedium: const TextStyle(color: Colors.white),
              titleSmall: const TextStyle(color: Colors.white),
              bodyLarge: const TextStyle(color: Colors.white),
              bodyMedium: const TextStyle(color: Colors.white),
              bodySmall: const TextStyle(color: Colors.white),
              labelLarge: const TextStyle(color: Colors.white),
              labelMedium: const TextStyle(color: Colors.white),
              labelSmall: const TextStyle(color: Colors.white),
            ),
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: white,
  );
  static const headlineMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: greyText,
  );
  static const titleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );
}
